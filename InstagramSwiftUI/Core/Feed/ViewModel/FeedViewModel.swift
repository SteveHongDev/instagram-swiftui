//
//  FeedViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/8/24.
//

import Foundation
import Firebase

@Observable
class FeedViewModel {
    var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
