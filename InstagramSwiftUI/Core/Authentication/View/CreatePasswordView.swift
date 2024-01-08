//
//  CreatePasswordView.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(RegistrationViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        SignupDefaultView(isPasswordView: true, title: "Create a password", subtitle: "Your password must be at least 6 characters in length", placeholder: "Password", text: $viewModel.password, buttonTitle: "Next", destination: AnyView(CompleteSignupView()))
    }
}

//#Preview {
//    CreatePasswordView()
//}
