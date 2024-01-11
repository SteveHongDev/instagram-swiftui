//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/11/24.
//

import SwiftUI
import Firebase

struct CommentCell: View {
    
    let comment: Comment
    
    private var user: User? {
        return comment.user
    }
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xSmall)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user?.username ?? "")
                        .fontWeight(.semibold)
                    
                    Text(comment.timestamp.timestampString())
                        .foregroundStyle(.gray)
                }
                
                Text(comment.commentText)
            }
            .font(.caption)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentCell(comment: Comment(commentOwnerUid: "123", commentText: "Test Comment", postId: "13132", postOwnerUid: "123123", timestamp: Timestamp()))
}
