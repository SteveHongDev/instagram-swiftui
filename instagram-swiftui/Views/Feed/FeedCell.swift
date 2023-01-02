//
//  FeedCell.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/02.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                Image("apple-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("AppleOfficial")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(5)
            
//            // post image
            Image("apple-music")
                .resizable()
                .scaledToFit()
            
            // action buttons
            HStack(spacing: 8) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }
            .foregroundColor(.black)
            
            // caption
            HStack {
                Text("AppleOfficial").font(.system(size: 14, weight: .semibold)) +
                Text("  Apple music is the best music app in the world!").font(.system(size: 15))
            }
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.top)
        }
        
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
