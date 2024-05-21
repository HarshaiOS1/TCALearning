//
//  BookDetailReducer.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 21/05/2024.
//

import Foundation
import ComposableArchitecture

class BookDetailReducer: Reducer {
    @Dependency(\.bookClient) var bookclient
    
    struct State: Equatable {
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
            if let characterUrls = state.book.characters {
                return .run { send in
                    let characters = try? await self.bookclient.fetchCharacters(characterUrls)
                    await send(.characterFetched(characters))
                }
            } else {
                return .none
            }
        case .characterFetched(let characters):
            state.isLoading = false
            state.characters = characters
            return .none
        }
    }
}
