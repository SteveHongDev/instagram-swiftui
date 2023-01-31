//
//  UserListView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/11.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(users) { user in
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserCell(user: user)
                            .padding(.leading)
                    }

                }
            }
        }
    }
}

