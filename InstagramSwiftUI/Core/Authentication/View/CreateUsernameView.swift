//
//  CreateUsernameView.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(RegistrationViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        SignupDefaultView(isPasswordView: false, title: "Create Username", subtitle: "Pick a username for your new account. You can always change it later.", placeholder: "Username", text: $viewModel.username, buttonTitle: "Next", destination: AnyView(CreatePasswordView()))
    }
}

//#Preview {
//    CreateUsernameView()
//}
