//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/11/24.
//

import Foundation

@Observable class ProfileViewModel {
    var user: User
    
    init(user: User) {
        self.user = user
    }
}

// MARK: - Following

extension ProfileViewModel {
    func follow() {
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
            
            IGNotificationManager.shared.uploadFollowNotification(to: user.id)
        }
    }
    
    func unfollow() {
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
            
            await IGNotificationManager.shared.deleteFollowNotification(notificationOwnerUid: user.id)
        }
    }
    
    @MainActor
    func checkIfUserIsFollowed() async {
        guard user.isFollowed == nil else { return }
        
        do {
            user.isFollowed = try await UserService.checkIfUserIsFollowed(uid: user.id)
        } catch {
            print("DEBUG: checkIfUserIsFollowed error // \(error.localizedDescription)")
        }
    }
}

// MARK: - User Stats

extension ProfileViewModel {
    @MainActor
    func fetchUserStats() async {
        guard user.stats == nil else { return }
        
        do {
            self.user.stats = try await UserService.fetchUserStats(uid: user.id)
        } catch {
            print("DEBUG: fetchUserStats error // \(error.localizedDescription)")
        }
    }
}
