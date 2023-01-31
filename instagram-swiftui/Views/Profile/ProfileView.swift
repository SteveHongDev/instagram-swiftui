//
//  ProfileView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/02.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(user: user)
                
                PostGridView()
            }
            .padding(.top)
        }
    }
}
