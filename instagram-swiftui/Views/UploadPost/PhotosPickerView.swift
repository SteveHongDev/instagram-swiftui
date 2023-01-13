//
//  PhotosPickerView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/13.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    
    @Binding var selectedImage: PhotosPickerItem?
    @Binding var selectedImageData: Data?
    
    var body: some View {
        
        PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 96, height: 96)
                    .clipShape(Circle())
            } else {
                Image("plus_photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 96, height: 96)
                    .clipped()
            }
        } //: PHOTOSPICKER
        .onChange(of: selectedImage) { newValue in
            Task {
                if let data = try? await newValue?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
    }
}

//struct PhotosPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosPickerView()
//    }
//}
