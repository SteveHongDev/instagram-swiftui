//
//  LoginView.swift
//  instagram-swiftui
//
//  Created by 홍성범 on 2023/01/13.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Image("instagram-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                    
                    VStack(spacing: 20) {
                        // email field
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // password field
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    // forgot password
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                    }
                    
                    // sign in
                    Button {
                        viewModel.login(withEmail: email, password: password)
                    } label: {
                        Text("Sign in")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(.purple)
                            .clipShape(Capsule())
                            .padding()
                            
                    }

                    Spacer()
                    
                    // go to sign up
                    
                    NavigationLink {
                        RegistrationView()
                            .toolbar(.hidden)
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                    }
                    .padding(.bottom, 16)
                } //: VSTACK
            } //: ZSTACK
        } //: NAVIGATION
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
