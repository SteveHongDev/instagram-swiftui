//
//  IGNotificationType.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation

enum IGNotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return "liked one of your posts."
        case .comment: return "commented on one of your posts."
        case .follow: return "started following you."
        }
    }
}
