//
//  Search.swift
//  Spendific
//
//  Created by Pranav R on 25/06/24.
//

import SwiftUI

struct Search: View {
    // View Properties
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, content: {
                LazyVStack(content: {
                    
                })
            })
            .overlay(content: {
                if #available(iOS 17.0, *) {
                    ContentUnavailableView("Search Transactions", systemImage: "magnifyingglass")
                } else {
                    // Fallback on earlier versions
                }
            })
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Search")
        }
    }
}

#Preview {
    Search()
}
