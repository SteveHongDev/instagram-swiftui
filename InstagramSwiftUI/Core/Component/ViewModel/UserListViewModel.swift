//
//  UserListViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation

@Observable class UserListViewModel {
    var users = [User]()
    
    @MainActor
    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print("DEBUG: Failed to fetch users with error \(error.localizedDescription)")
        }
    }
}
