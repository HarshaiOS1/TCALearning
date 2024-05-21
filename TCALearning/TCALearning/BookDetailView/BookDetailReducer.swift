//
//  BookDetailReducer.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 21/05/2024.
//

import Foundation
import ComposableArchitecture

class BookDetailReducer: Reducer {
    
    struct State {
        var book: Book
        var characters: [Character]?
        var isLoading: Bool = false
    }
    
    enum Action {
        case fetchCharacters
        case characterFetched([Character]?)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchCharacters:
            state.isLoading = true
            return .none
        case .characterFetched(let characters):
            state.isLoading = false
            state.characters = characters
            return .none
        }
    }
}
