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
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login() {
        print("Login")
    }
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user
            print("User registration completed.")
        }
    }
    
    func resetPassword() {
        
    }
    
    func signout() {
        
    }
    
    func fetchUser() {
        
    }
}
