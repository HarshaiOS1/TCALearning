//
//  BooksListView.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 17/05/2024.
//

import SwiftUI
import ComposableArchitecture

struct BooksListView: View {
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .navigationTitle("Books")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "arrow.clockwise.square")
                        }
                    }
                })
        }
    }
}

#Preview {
    BooksListView()
}
