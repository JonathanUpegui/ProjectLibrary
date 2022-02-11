//
//  BooksModels.swift
//  ProjectLibrary
//
//  Created by Upegui on 3/07/21.
//

import Foundation

struct Book: Codable {
    var image: String
    var title: String
    var id: Int
    var author: String
    var year: String
    var status: String
    var genre: String
}

struct RentBook: Codable {
    let from: String
    let id: Int
    let to: String
    let bookId: Int
    let userId: Int

    enum CodingKeys: String, CodingKey {
        case from, id, to
        case bookId = "book_id"
        case userId = "user_id"
    }
}

struct RentBookRequest: Codable {
    let userId: Int
    let bookId: Int
    let from: String
    let to: String

    enum CodingKeys: String, CodingKey {
        case from, to
        case userId = "user_id"
        case bookId = "book_id"
    }
}

struct Comment: Codable {
    let id: Int
    let bookId: Int
    let userId: Int
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id, content
        case userId = "user_id"
        case bookId = "book_id"
    }
}

struct UserInformation: Codable {
    let id: Int
    let username: String
    let image: String
}

struct RentBookItem: Codable, Hashable {
    let bookId: Int
    
    enum CodingKeys: String, CodingKey {
        case bookId = "book_id"
    }
}

struct BookSuggestion: Codable {
    let id: Int
    let userId: Int
    let link: String
    let title: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case id, link, title, author
        case userId = "user_id"
    }
}
