//
//  CreateProfileImageView.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/23.
//

import SwiftUI
import PhotosUI

struct CreateProfileImageView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    var isValidProfileImage: Bool {
        return viewModel.profileImage != nil
    }
    var body: some View {
        VStack(spacing: 12){
            Text("Add a profile image")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("This image will be displayed to other users.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .clipShape(Circle())
                            .foregroundColor(Color(.systemGray6))
                            .frame(width: 50, height: 50)
                        
                    }
                }
                .padding(.vertical, 8)
                
                NavigationLink{
                  ContinueView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Finish")
                        .modifier(CustomButtonModifier())
                        .padding(.vertical)
                }
                .opacity(isValidProfileImage ? 1.0 : 0.9)
                .brightness(isValidProfileImage ? 0.0 : -0.2)
                .disabled(!isValidProfileImage)
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
}
//
//#Preview {
//    CreateProfileImageView()
//}
