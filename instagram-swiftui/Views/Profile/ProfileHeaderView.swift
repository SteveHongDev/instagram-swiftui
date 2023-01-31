//
//  ProfileHeaderView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/11.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack {
                    UserStatView(value: 1, title: "Posts")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 4, title: "Following")
                }
                .padding(.trailing)
            }
            
            Text(user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("I love SwiftUI. I wanna be the greatest iOS Developer!!")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}
