//
//  CreateUsernameView.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var isValidUsername: Bool {
        return !viewModel.username.isEmpty
    }
    var body: some View {
        VStack(spacing: 12){
            Text("Create your username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("This username will be displayed to other people.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            TextField("Username", text: $viewModel.username)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.top, 5)
            
            
            NavigationLink {
               CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(CustomButtonModifier())
                    .padding(.vertical)
            }
            .opacity(isValidUsername ? 1.0 : 0.9)
            .brightness(isValidUsername ? 0.0 : -0.2)
            .disabled(!isValidUsername)
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
//    CreateUsernameView()
//}
