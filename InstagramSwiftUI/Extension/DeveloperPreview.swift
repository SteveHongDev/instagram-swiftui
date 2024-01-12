//
//  DeveloperPreview.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation
import Firebase

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(commentOwnerUid: "123138", commentText: "Test comment for now", postId: "3214", postOwnerUid: "3289", timestamp: Timestamp())
    
    let notifications: [IGNotification] = [
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "123", type: .like),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "456", type: .comment),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "678", type: .follow),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "789", type: .like),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "890", type: .like),
    ]
}
