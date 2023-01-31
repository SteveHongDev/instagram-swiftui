//
//  ProfileActionButtonView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/12.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    let isCurrentUser: Bool
    var isFollowed = false
    
    var body: some View {
        
        if isCurrentUser {
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
        } else {
            // follow, message button
            HStack {
                Button {
                    
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                }
                .cornerRadius(3)
                
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: 1)
                        )
                }
                .cornerRadius(3)
            }
        }
    }
}
