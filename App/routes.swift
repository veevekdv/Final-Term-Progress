import Vapor

func routes(_ app: Application) throws {
    let bookController = BookController()
    try app.register(collection: bookController)
}
