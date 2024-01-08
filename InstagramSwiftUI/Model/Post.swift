//
//  Post.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I'm Nezuko",
            likes: 307,
            imageUrl: "nezuko",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I'm Tanjirou",
            likes: 800,
            imageUrl: "tanjirou",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I'm Zenitsu",
            likes: 50,
            imageUrl: "zenitsu",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
    ]
}
