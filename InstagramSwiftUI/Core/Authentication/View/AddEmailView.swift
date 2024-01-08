//
//  AddEmailView.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(RegistrationViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        SignupDefaultView(isPasswordView: false, title: "Add your email", subtitle: "You'll use this email to sign in to your account", placeholder: "Email", text: $viewModel.email, buttonTitle: "Next", destination: AnyView(CreateUsernameView()))
    }
}

//#Preview {
//    AddEmailView()
//}
