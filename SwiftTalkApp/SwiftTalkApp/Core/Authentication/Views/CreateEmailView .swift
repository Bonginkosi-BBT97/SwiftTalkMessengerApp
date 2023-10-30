//
//  CreateEmailView .swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/23.
//

import SwiftUI

struct CreateEmailView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var isEmailValid: Bool {
        return viewModel.email.contains("@")
    }
    
    var body: some View {
        VStack(spacing: 12){
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            TextField("Email", text: $viewModel.email)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.top, 5)
            
            
            NavigationLink {
               CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(CustomButtonModifier())
                    .padding(.vertical)
            }
            .opacity(isEmailValid ? 1.0 : 0.9)
            .brightness(isEmailValid ? 0.0 : -0.2)
            .disabled(!isEmailValid )
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

//struct CreateEmailView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        CreateEmailView()
//    }
//}
