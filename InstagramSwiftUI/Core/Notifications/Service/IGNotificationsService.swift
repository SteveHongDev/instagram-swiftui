//
//  NotificationsService.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation
import Firebase

class IGNotificationsService {
    
    func fetchNotifications() async throws -> [IGNotification] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await FirebaseConstants.UserNotificationCollection(uid: currentUid).getDocuments()
        
        return snapshot.documents.compactMap { try? $0.data(as: IGNotification.self) }
    }
    
    func uploadNotification(to uid: String, type: IGNotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid, currentUid != uid else { return }
        
        let ref = FirebaseConstants.UserNotificationCollection(uid: uid).document()
        
        let notification = IGNotification(id: ref.documentID, postId: post?.id, timestamp: Timestamp(), notificationSenderUid: currentUid, type: type)
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        
        ref.setData(notificationData)
    }
    
    func deleteNotification(to uid: String, type: IGNotificationType, post: Post? = nil) {
        
    }
}
