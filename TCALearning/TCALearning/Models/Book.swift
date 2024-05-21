//
//  Book.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 17/05/2024.
//

import Foundation

struct Book: Codable, Equatable {
    let url: String?
    let name, isbn: String?
    let authors: [String]?
    let numberOfPages: Int?
    let publisher: String?
    let country: String?
    let mediaType, released: String?
    let characters, povCharacters: [String]?
    
    static let mock: Book = Book(url: "anapioficeandfire.com/api/books/1", name: "A Game of Thrones", isbn: "978-0553103540", authors: nil, numberOfPages: nil, publisher: nil, country: nil, mediaType: nil, released: nil, characters: nil, povCharacters: nil)

}
