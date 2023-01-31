//
//  SearchViewModel.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/27.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { snapshot in
                guard let user = try? snapshot.data(as: User.self) else { return }
                self.users.append(user)
            }
            
            print(self.users)
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        
        return users.filter { user in
            user.fullname.lowercased().contains(lowercasedQuery) || user.username.lowercased().contains(lowercasedQuery)
        }
    }
}
