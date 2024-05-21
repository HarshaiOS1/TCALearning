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
        var path = StackState<BookDetailReducer.State>()
        var books: [Book]?
    }
    
    enum Action {
        case fetchBooks
        case booksFetched([Book]?)
        case path(StackAction<BookDetailReducer.State, BookDetailReducer.Action>)
    }
    
    var body: some ReducerOf<BookListReducer> {
        Reduce { state, action in
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
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            BookDetailReducer()
        }
    }
}
