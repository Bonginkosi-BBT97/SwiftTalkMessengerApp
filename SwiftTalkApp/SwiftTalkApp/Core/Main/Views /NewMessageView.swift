//
//  NewMessageView.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/26.
//

import SwiftUI

struct NewMessageView: View {
    let didSelectUser: (User) -> ()
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = NewMessageViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.users) { user in
                            Button {
                                dismiss()
                                didSelectUser(user)
                            } label: {
                                NewMessageCell(user: user)
                            }
                            
                            Divider()
                        }
                    }
                }
            }
            .padding(.top)
            .navigationTitle("New Mesage")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    NewMessageView(didSelectUser: {_ in })
}
