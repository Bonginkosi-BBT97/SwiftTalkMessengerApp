//
//  LoginView.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var isLoginValid: Bool {
        email.contains("@") && password.count >= 6
    }
    var body: some View {
        NavigationView {
            VStack {
                Image("messengerapp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)
                
                TextField("Enter Your Email", text: $email)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                SecureField("Enter Your Password", text: $password)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .padding(.top, 5)
                
                Button {
                    
                    Task {
                        try await viewModel.login(email:email, password: password)
                    }
                } label: {
                     Text("Login")
                        .modifier(CustomButtonModifier())
                        .padding(.vertical)
                }
                .opacity(isLoginValid ? 1.0 : 0.9)
                .brightness(isLoginValid ? 0.0 : -0.2)
                .disabled(!isLoginValid)
                
                NavigationLink {
                    
                    CreateEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("No Account?")
                            .foregroundColor(.secondary)
                        Text("Sign Up")
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CustomButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.red))
            .cornerRadius(8)
    }
}
