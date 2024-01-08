//
//  RegistrationViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/6/24.
//

import Foundation

@Observable class RegistrationViewModel {
    var username = ""
    var email = ""
    var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
}
