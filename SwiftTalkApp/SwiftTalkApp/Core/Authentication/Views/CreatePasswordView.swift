//
//  CreatePasswordView.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    var isValidPassword: Bool {
        return viewModel.password.count >= 6
    }
    var body: some View {
        VStack(spacing: 12){
            Text("Create a password ")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this password to sign in to your account.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            TextField("Password", text: $viewModel.password)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.top, 5)
            
            
            NavigationLink {
               CreateProfileImageView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(CustomButtonModifier())
                    .padding(.vertical)
            }
            
            .opacity(isValidPassword ? 1.0 : 0.9)
            .brightness(isValidPassword ? 0.0 : -0.2)
            .disabled(!isValidPassword)
            Spacer()
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                     Image(systemName: "chevron.left")
                        .imageScale(.large)
                }
            }
        }
    }
}

//#Preview {
//    CreatePasswordView()
//}
