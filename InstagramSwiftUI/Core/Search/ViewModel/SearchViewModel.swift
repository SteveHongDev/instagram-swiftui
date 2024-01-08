//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/8/24.
//

import Foundation

@Observable class SearchViewModel {
    var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        users = try await UserService.fetchAllUsers()
    }
}
