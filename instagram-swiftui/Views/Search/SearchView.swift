//
//  SearchView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/02.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
//            PostGridView()
            UserListView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
