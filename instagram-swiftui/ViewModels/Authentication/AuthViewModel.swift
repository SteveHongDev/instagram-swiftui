//
//  AuthViewModel.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/14.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, imageData: Data?, fullname: String, username: String) {
        
        guard let imageData = imageData else { return }
        guard let image = UIImage(data: imageData) else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                
                self.userSession = user
                print("User registration completed.")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("User data uploaded.")
                }
            }
        }
    }
    
    func resetPassword() {
        
    }
    
    func signout() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        
    }
}
