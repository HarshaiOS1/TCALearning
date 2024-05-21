//
//  BookDetailView.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 21/05/2024.
//

import SwiftUI
import ComposableArchitecture

struct BookDetailView: View {
    let store: StoreOf<BookDetailReducer>
    
    var body: some View {
        NavigationView {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                List {
                    if viewStore.isLoading {
                        ProgressView()
                    }
                    if let chars = viewStore.characters {
                        ForEach(chars, id: \.url) { char in
                            Text(char.name ?? "")
                        }
                    }
                }
                .navigationTitle(Text(viewStore.book.name ?? ""))
                .onAppear{
                    viewStore.send(.fetchCharacters)
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        BookDetailView(store: Store(initialState: BookDetailReducer.State(book: Book.mock), reducer: {
            BookDetailReducer()
        }))
    }
}
