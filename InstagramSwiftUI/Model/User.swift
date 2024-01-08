//
//  User.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: nil, fullname: "Bruce Wayne", bio: "Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: nil, fullname: "Eddie Brock", bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "nezuko", profileImageUrl: nil, fullname: nil, bio: "귀멸의 칼날 - 네즈코", email: "nezuko@gmail.com"),
        .init(id: NSUUID().uuidString, username: "tanjirou", profileImageUrl: nil, fullname: "Kamado Tanjirou", bio: "귀멸의 칼날 - 탄지로", email: "tanjirou@gmail.com"),
        .init(id: NSUUID().uuidString, username: "zenitsu", profileImageUrl: nil, fullname: "Agatsuma Zenitsu", bio: "귀멸의 칼날 - 젠이츠", email: "zenitsu@gmail.com"),
    ]
}
