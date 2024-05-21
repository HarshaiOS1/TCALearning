//
//  BookListReducer.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 17/05/2024.
//

import Foundation
import ComposableArchitecture

class BookListReducer: Reducer {
    
    struct State: Equatable {
        var books: [Book]?
    }
    
    enum Action {
        case fetchBooks
        case booksFetched([Book]?)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchBooks:
            return .run { send in
                if let url = URL(string: Constants.getBooksurl) {
                    let (data,_) = try await URLSession.shared.data(from: url)
                    let books = try? JSONDecoder().decode([Book].self, from: data)
                    await send(.booksFetched(books))
                }
            }
        case .booksFetched(let books):
            state .books = books
            return .none
        }
    }
    
}
