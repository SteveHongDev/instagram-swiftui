//
//  ProfileHeaderView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/11.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("profile-image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack {
                    UserStatView()
                    UserStatView()
                    UserStatView()
                }
                .padding(.trailing)
            }
            
            Text("Seongbeom Hong")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("I love SwiftUI. I wanna be the greatest iOS Developer!!")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
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
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct UserStatView: View {
    var body: some View {
        VStack {
            Text("2")
                .font(.system(size: 15, weight: .semibold))
            
            Text("Following")
                .font(.system(size: 15))
        }
        .frame(width: 80, alignment: .center)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
