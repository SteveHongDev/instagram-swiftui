//
//  IGNotification.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation
import Firebase

struct IGNotification: Identifiable, Codable {
    let id: String
    var postId: String?
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: IGNotificationType
    
    var post: Post?
    var user: User? 
}
