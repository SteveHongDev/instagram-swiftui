//
//  NotificationsViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import Foundation

@Observable class NotificationsViewModel {
    
    var notifications = [IGNotification]()
    
    private let service: IGNotificationsService
    private var currentUser: User?
    
    init(service: IGNotificationsService) {
        self.service = service
        
        Task { await fetchNotifications() }
        currentUser = UserService.shared.currentUser
    }
    
    @MainActor
    func fetchNotifications() async {
        do {
            self.notifications = try await service.fetchNotifications()
            
            try await updateNotifications()
        } catch {
            print("DEBUG: Failed to fetch notifications with error // \(error.localizedDescription)")
        }
    }
    
    private func updateNotifications() async throws {
        for i in 0 ..< notifications.count {
            var notification = notifications[i]
            notification.user = try await UserService.fetchUser(withUid: notification.notificationSenderUid)
            
            if let postId = notification.postId {
                notification.post = try await PostService.fetchPost(postId: postId)
                notification.post?.user = self.currentUser
            }
            
            notifications[i] = notification
        }
    }
}
