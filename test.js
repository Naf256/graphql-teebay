const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()


async function main() {
  const users = await prisma.user.findMany({
    select: {
      products: true
    }
  })
  await prisma.product.deleteMany()
  await prisma.user.deleteMany()
  const user = await prisma.user.create({
    data: {
      username: "joe",
      password: "hfkdf"
    }
  })

  const product = await prisma.product.create({
    data: {
      owner: {
        connect: {
          id: user.id
        }
      },
      name: "nezuko",
      status: "available",
      catagories: ["toy", "stationary"],
    },
    select: {
      owner: {
        select: {
          username: true,
          password: true
        },
      },
      name: true,
    }
  })

  console.log(product)
}

main()
