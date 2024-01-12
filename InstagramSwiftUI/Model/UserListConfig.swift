//
//  UserListConfig.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation

enum UserListConfig: Hashable {
    case followers(uid: String)
    case following(uid: String)
    case likes(postId: String)
    case explore
    
    var navigationTitle: String {
        switch self {
        case .followers: return "Followers"
        case .following: return "Following"
        case .likes: return "Likes"
        case .explore: return "Explore"
        }
    }
}
