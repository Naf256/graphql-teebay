const schema = `
  type User {
    id: Int!
    username: String!
    password: String!
    products: [Product]
  }

  type Token {
    value: String
  }

  enum Genre {
    toy
    food
    stationary
  }

  enum StatusCheck {
    available
    sold
    rented
  }

  type Product {
    id: Int!
    owner: User!
    catagories: [Genre!]
    name: String!
    ownerId: Int!
    status: StatusCheck
  }

  type BoughtUser {
    username: String!
    password: String!
  }

  type Result {
    name: String!
    boughtUser: BoughtUser!
  }

  type Query {
    allUsers: [User!]
    allProducts: [Product!]
    findProduct(id: Int!): Product
    findAvailableProducts: [Product!]
  }

  type Mutation {
    login(
      username: String!,
      password: String!
    ): Token

    buyStuff(
      id: Int!,
      name: String!,
      catagories: [String]!
    ): Result

    createNewUser(
      username: String!
      password: String!
    ): User
  }
`

module.exports = schema
