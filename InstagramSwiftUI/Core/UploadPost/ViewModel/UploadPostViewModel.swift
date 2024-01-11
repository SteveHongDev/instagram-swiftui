//
//  UploadPostViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import SwiftUI
import PhotosUI
import Firebase

@Observable
class UploadPostViewModel {
    
    var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(from: selectedImage) } }
    }
    
    var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = FirebaseConstants.PostsCollection.document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
