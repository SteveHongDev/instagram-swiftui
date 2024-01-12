//
//  CommentsViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/11/24.
//

import Firebase

@Observable class CommentsViewModel {
    
    var comments = [Comment]()
    
    private let post: Post
    private let service: CommentService
    
    init(post: Post) {
        self.post = post
        self.service = CommentService(postId: post.id)
        
        Task { try await fetchComments() }
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = Comment(commentOwnerUid: uid, commentText: commentText, postId: post.id, postOwnerUid: post.ownerUid, timestamp: Timestamp())
        
        try await service.uploadComment(comment)
        IGNotificationManager.shared.uploadCommentNotification(to: post.ownerUid, post: post)
    }
    
    @MainActor
    func fetchComments() async throws {
        self.comments = try await service.fetchComments()
        try await fetchUserDataForComments()
    }
    
    @MainActor
    private func fetchUserDataForComments() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
}
