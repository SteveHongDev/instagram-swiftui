//
//  UserCell.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/11.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            // image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                // user name
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                // full name
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
        } //: HSTACK
    }
}

