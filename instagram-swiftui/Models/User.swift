//
//  User.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/25.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}
