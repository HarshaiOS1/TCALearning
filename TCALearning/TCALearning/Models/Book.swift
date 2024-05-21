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
}
