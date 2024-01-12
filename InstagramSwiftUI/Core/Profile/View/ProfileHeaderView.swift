//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var viewModel: ProfileViewModel
    @State private var showEditProfile = false
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    private var user: User {
        return viewModel.user
    }
    
    private var stats: UserStats {
        return user.stats ?? .init(followingCount: 0, followersCount: 0, postsCount: 0)
    }
    
    private var isFollowed: Bool {
        return user.isFollowed ?? false
    }
    
    private func setButtonColor(first: Color, second: Color) -> Color {
        return user.isCurrentUser || isFollowed ? first : second
    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            // pic and stats
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: stats.postsCount, title: "Posts")
                    
                    NavigationLink(value: UserListConfig.followers(uid: user.id)) {
                        UserStatView(value: stats.followersCount, title: "Followers")
                    }
                    
                    NavigationLink(value: UserListConfig.following(uid: user.id)) {
                        UserStatView(value: stats.followingCount, title: "Following")
                    }
                }
            }
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    handleFollowTapped()
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : isFollowed ? "Following" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(setButtonColor(first: .white, second: Color(.systemBlue)))
                    .foregroundStyle(setButtonColor(first: .black, second: .white))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(setButtonColor(first: .gray, second: .clear), lineWidth: 1))
            }
            Divider()
        }
        .task { await viewModel.checkIfUserIsFollowed() }
        .task { await viewModel.fetchUserStats() }
        .navigationDestination(for: UserListConfig.self) { config in
            UserListView(config: config)
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
    
    func handleFollowTapped() {
        if isFollowed {
            viewModel.unfollow()
        } else {
            viewModel.follow()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
