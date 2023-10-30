//
//  NewMessageCell.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/26.
//

import SwiftUI
import Kingfisher

struct NewMessageCell: View {
    
    var user:User
    
    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8){
                Text(user.username)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    NewMessageCell(user: users[0])
}
