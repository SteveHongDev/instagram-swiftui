//
//  NotificationManager.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation

class IGNotificationManager {
    
    static let shared = IGNotificationManager()
    private let service = IGNotificationsService()
    
    func uploadLikeNotification(to uid: String, post: Post) {
        service.uploadNotification(to: uid, type: .like, post: post)
    }
    
    func uploadCommentNotification(to uid: String, post: Post) {
        service.uploadNotification(to: uid, type: .comment, post: post)
    }
    
    func uploadFollowNotification(to uid: String) {
        service.uploadNotification(to: uid, type: .follow)
    }
    
    func deleteLikeNotification(notificationOwnerUid: String, post: Post) async {
        do {
            try await service.deleteNotification(to: notificationOwnerUid, type: .like, post: post)
        } catch {
            print("DEBUG: Failed to delete like notification")
        }
    }
    
    func deleteFollowNotification(notificationOwnerUid: String) async {
        do {
            try await service.deleteNotification(to: notificationOwnerUid, type: .follow)
        } catch {
            print("DEBUG: Failed to delete follow notification")
        }
    }
}
