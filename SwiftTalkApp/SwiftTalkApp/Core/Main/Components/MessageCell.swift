//
//  MessageCell.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/26.
//

import SwiftUI

struct MessageCell: View {
    let message: Message
    let isFromCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .foregroundColor(.white)
                    .padding (10)
                    .background (Color.blue)
                    .cornerRadius (10)
                
            } else {
                Text(message.text)
                    .foregroundColor(.white)
                    .padding (10)
                    .background (Color.gray.opacity(0.8))
                    .cornerRadius (10)
                Spacer()
            }
        }
    }
}

#Preview {
    MessageCell(message: Message(id: "", fromId: "", toId: "", text: "", date: Date()), isFromCurrentUser: true)
}
