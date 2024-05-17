//
//  TCALearningApp.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 17/05/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCALearningApp: App {
    var body: some Scene {
        WindowGroup {
            BooksListView(store: Store(initialState: BookListReducer.State(), reducer: {
                BookListReducer()
            }))
        }
    }
}
