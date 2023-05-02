const { ApolloServer } = require('@apollo/server')
const { startStandaloneServer } = require('@apollo/server/standalone')
const jwt = require('jsonwebtoken')
const typeDefs = require('./schema')
const resolvers = require('./resolvers')

const server = new ApolloServer({
	typeDefs,
	resolvers,
})

startStandaloneServer(server, {
	listen: { port: 4000 },
	context: async ({ req }) => {
		const auth = req ? req.authorization : null

		if (auth && auth.startsWith('bearer ')) {
			const currentUser = jwt.verify(auth.substring(7), 'secret')

			return {
				currentUser
			}
		}
	}
})
  .then(() => {
	  console.log('server listening to http://localhost:4000/graphql')
  })


