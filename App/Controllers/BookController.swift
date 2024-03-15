import Vapor

struct BookController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let booksRoute = routes.grouped("books")
        booksRoute.post(use: create)
        booksRoute.get(use: getAll)
        booksRoute.get(":bookID", use: get)
        booksRoute.put(":bookID", use: update)
        booksRoute.delete(":bookID", use: delete)
    }
    
    func create(req: Request) throws -> EventLoopFuture<Book> {
        let book = try req.content.decode(Book.self)
        return book.save(on: req.db).map { book }
    }
    
    func getAll(req: Request) throws -> EventLoopFuture<[Book]> {
        Book.query(on: req.db).all()
    }
    
    func get(req: Request) throws -> EventLoopFuture<Book> {
        Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    func update(req: Request) throws -> EventLoopFuture<Book> {
        let updatedBook = try req.content.decode(Book.self)
        return Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound)).flatMap { book in
                book.title = updatedBook.title
                book.author = updatedBook.author
                book.year = updatedBook.year
                return book.save(on: req.db).map { book }
            }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
import Vapor

struct BookController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let booksRoute = routes.grouped("books")
        booksRoute.post(use: create)
        booksRoute.get(use: getAll)
        booksRoute.get(":bookID", use: get)
        booksRoute.put(":bookID", use: update)
        booksRoute.delete(":bookID", use: delete)
    }
    
    func create(req: Request) throws -> EventLoopFuture<Book> {
        let book = try req.content.decode(Book.self)
        return book.save(on: req.db).map { book }
    }
    
    func getAll(req: Request) throws -> EventLoopFuture<[Book]> {
        Book.query(on: req.db).all()
    }
    
    func get(req: Request) throws -> EventLoopFuture<Book> {
        Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    func update(req: Request) throws -> EventLoopFuture<Book> {
        let updatedBook = try req.content.decode(Book.self)
        return Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound)).flatMap { book in
                book.title = updatedBook.title
                book.author = updatedBook.author
                book.year = updatedBook.year
                return book.save(on: req.db).map { book }
            }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Book.find(req.parameters.get("bookID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
