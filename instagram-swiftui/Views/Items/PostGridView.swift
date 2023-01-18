//
//  PostGridView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/10.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: items, spacing: 2) {
                
                ForEach(0 ..< 9) { _ in
                    NavigationLink {
                        FeedView()
                    } label: {
                        Image("apple-logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                            .clipped()
                    }

                }
            } //: LAZYVGRID
        } //: GEO
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
