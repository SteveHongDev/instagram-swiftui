//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            UserListView(config: .explore)
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
