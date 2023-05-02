const { PrismaClient } = require('@prisma/client')
const jwt = require('jsonwebtoken')

const prisma = new PrismaClient()

const resolvers = {
	Query: {
		allUsers: async () => await prisma.user.findMany({
			select: {
				id: true,
				username: true,
				password: true,
			}
		}),
		allProducts: async () => await prisma.product.findMany({
			include: {
				owner: true,
			},
		}),
		findAvailableProducts: async () => {
			return await prisma.product.findMany({
				where: {
					status: 'available'
				},
				include: {
					owner: true,
				},
			})
		},
		findProduct: async (_root, args) => {
			return await prisma.product.findUnique({
				where: {
					id: args.id,
				},
				include: {
					owner: true,
				},
			})
		},
	},

	Mutation: {
		createNewUser: async (_root, args) => {
			const user = await prisma.user.create({
				data: {
					username: args.username,
					password: args.password,
				},

				select: {
					id: true,
					username: true,
					password: true,
				},
			})

			return user;
		},

		buyStuff: async (_root, args) => {
			const product = await prisma.product.create({
				data: {
					owner: {
						connect: { id: args.id }
					},
					boughtUser: {
						connect: { id: args.id }
					},
					status: "sold",
					name: args.name,
					catagories: [...args.catagories],
				},

				select: {
					name: true,
					boughtUser: {
						select: {
							username: true,
							password: true,
						},
					},
				},
			})

			return product;
		},

		login: async (_root, args) => {
			const user = await prisma.user.findFirstOrThrow({
				where: {
					username: args.username,
					password: args.password,
				},
				select: {
					username: true,
					id: true
				},
			})

			const userForToken = {
				username: user.username,
				id: user.id
			}

			if (user) {
				const token = jwt.sign(userForToken, 'secret')
				return {
					value: token
				}
			} else {
				return null
			}
		},
	},
}

module.exports = resolvers
