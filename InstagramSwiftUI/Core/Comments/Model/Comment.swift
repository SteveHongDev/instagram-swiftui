//
//  Comment.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/11/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String?
    let commentOwnerUid: String
    let commentText: String
    let postId: String
    let postOwnerUid: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
}
