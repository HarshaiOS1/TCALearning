//
//  Character.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 21/05/2024.
//

import Foundation

struct Character: Codable, Equatable {
    let url: String?
    let name, gender, culture, born: String?
    let died: String?
    let titles, aliases: [String]?
    let father, mother, spouse: String?
    let allegiances, books, povBooks: [String]?
    let tvSeries, playedBy: [String]?
}
