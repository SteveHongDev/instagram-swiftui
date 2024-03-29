//
//  FeedCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/10/24.
//

import Foundation

@Observable class FeedCellViewModel {
    var post: Post

    init(post: Post) {
        self.post = post
        Task { try await checkIfUserLikedPost() }
    }

    func checkIfUserLikedPost() async throws {
        self.post.didLike = try await PostService.checkIfUserLikedPost(post)
    }

    @MainActor
    func like() async throws {
        do {
            let currentPost = post
            post.didLike = true
            post.likes += 1
            try await PostService.likePost(currentPost)
            IGNotificationManager.shared.uploadLikeNotification(to: post.ownerUid, post: post)
        } catch {
            post.didLike = false
            post.likes -= 1
        }
    }

    @MainActor
    func unlike() async throws {
        do {
            let currentPost = post
            post.didLike = false
            post.likes -= 1
            try await PostService.unlikePost(currentPost)
            
            await IGNotificationManager.shared.deleteLikeNotification(notificationOwnerUid: post.ownerUid, post: post)
        } catch {
            post.didLike = true
            post.likes += 1
        }
    }
}
