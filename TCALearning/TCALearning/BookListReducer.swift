//
//  BookListReducer.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 17/05/2024.
//

import Foundation
import ComposableArchitecture

class BookListReducer: Reducer {
    struct State {
        //to keep model data
    }
    
    enum Action {
        case fetchBooks
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchBooks:
            return .none
        }
    }
    
}
