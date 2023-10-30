//
//  ContentView.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        if authenticationViewModel.currentUser == nil {
            LoginView()
                .environmentObject(authenticationViewModel)
        } else if let currentUser = authenticationViewModel.currentUser {
            HomeView(currentUser: currentUser)
                .environmentObject(authenticationViewModel)
        }
    }
}

#Preview {
    ContentView()
}
