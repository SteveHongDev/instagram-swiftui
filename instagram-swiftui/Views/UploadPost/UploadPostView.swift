//
//  UploadPostView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/02.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var captionText = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .clipped()
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
                
                TextField("Enter your caption...", text: $captionText)
            } //: HSTACK
            
            Button {
                
            } label: {
                Text("Share")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 360, height: 50)
                    .background(.blue)
                    .cornerRadius(5)
                    .foregroundColor(.white)
            }
            .padding()
            
            Spacer()
        }
        .padding()

    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
