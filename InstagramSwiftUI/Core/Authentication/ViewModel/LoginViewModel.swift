//
//  LoginViewModel.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/6/24.
//

import Foundation

@Observable class LoginViewModel {
    var email = ""
    var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(with: email, password: password)
    }
}
