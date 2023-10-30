//
//  ContinueView.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/24.
//

import SwiftUI

struct ContinueView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        VStack {
            Text("Welcome to the SwiftTalk App, \n \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click Continue to get started")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding()
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                HStack {
                    Image(systemName: "arrow.forward.circle.fill")
                        .imageScale(.large)
                    Text("Continue")
                        .font(.title)
                }
                .foregroundColor(.red)
            }
            .padding(.top, 2)
        }
    }
}

//#Preview {
//    ContinueView()
//}
