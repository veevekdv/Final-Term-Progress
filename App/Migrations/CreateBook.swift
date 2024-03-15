import Fluent

struct CreateBook: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("books")
            .id()
            .field("title", .string, .required)
            .field("author", .string, .required)
            .field("year", .int, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("books").delete()
    }
}
