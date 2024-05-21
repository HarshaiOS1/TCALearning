//
//  BooksListView.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 17/05/2024.
//

import SwiftUI
import ComposableArchitecture

struct BooksListView: View {
    /*
     depricated WithViewStore method update, use ObservedObject viewStore
     */
    let store: StoreOf<BookListReducer>
    @ObservedObject var viewStore: ViewStoreOf<BookListReducer>
    
    init(store: StoreOf<BookListReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        NavigationView {
            //            WithViewStore(self.store, observe: { $0 }) { viewStore in
            List {
                if let books = viewStore.books {
                    ForEach(books, id:  \.isbn) { book in
                        Text(book.name ?? "")
                    }
                } else {
                    Text("Book list is empty")
                }
            }
            
            .navigationTitle("Books")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        viewStore.send(.fetchBooks)
                    }) {
                        Image(systemName: "arrow.clockwise.square")
                    }
                }
            })
        }
        //        }
    }
}

#Preview {
    BooksListView(store: Store(initialState: BookListReducer.State(), reducer: {
        BookListReducer()
    }))
}
