//
//  NotificationsView.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/12/24.
//

import SwiftUI

struct NotificationsView: View {
    @State private var viewModel = NotificationsViewModel(service: IGNotificationsService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.notifications) { noti in
                        NotificationCell(notification: noti)
                            .padding(.top)
                    }
                }
            }
            .refreshable {
                Task { await viewModel.fetchNotifications() }
            }
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Notification")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}
