//
//  UserCell.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/11.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // image
            Image("profile-image")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                // user name
                Text("Steve")
                    .font(.system(size: 14, weight: .semibold))
                
                // full name
                Text("Seongbeom Hong")
                    .font(.system(size: 14))
            }
            
            Spacer()
        } //: HSTACK
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
