//
//  UserListView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/11.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(0 ..< 20) { _ in
                    UserCell()
                        .padding(.leading)
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
