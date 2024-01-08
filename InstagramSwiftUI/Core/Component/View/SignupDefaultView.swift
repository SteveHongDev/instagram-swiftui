//
//  SignupDefaultView.swift
//  InstagramSwiftUI
//
//  Created by 홍성범 on 1/5/24.
//

import SwiftUI

struct SignupDefaultView: View {
    let isPasswordView: Bool
    let title: String
    let subtitle: String
    let placeholder: String
    let text: Binding<String>
    let buttonTitle: String
    let destination: AnyView
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            if isPasswordView {
                SecureField(placeholder, text: text)
                    .modifier(IGTextFieldModifier())
            } else {
                TextField(placeholder, text: text)
                    .textInputAutocapitalization(.never)
                    .modifier(IGTextFieldModifier())
            }
            
            NavigationLink {
                destination
                    .navigationBarBackButtonHidden()
            } label: {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}
//
//#Preview {
//    SignupDefaultView(title: "Title", subtitle: "This is subtitle", placeholder: "Placeholder", text: "", buttonTitle: "Button", destination: AnyView(AddEmailView()))
//}
