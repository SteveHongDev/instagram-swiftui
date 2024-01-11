//
//  Constants.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/11/24.
//

import Firebase

struct FirebaseConstants {
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
    static let PostsCollection = Root.collection("posts")
}
