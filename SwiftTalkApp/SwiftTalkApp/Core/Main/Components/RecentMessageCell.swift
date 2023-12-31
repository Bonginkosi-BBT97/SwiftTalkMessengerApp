//
//  RecentMessageCell.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/30.
//

import SwiftUI
import Kingfisher
import Firebase
import FirebaseAuth

struct RecentMessageCell: View {
    
    let RecentMessage: RecentMessage
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a, M/d/yy"
        
        return formatter
    }
    
    var body: some View {
        VStack {
            
            HStack(spacing: 8) {
                KFImage (URL(string: RecentMessage.profileImageUrl))
                .resizable ()
                .scaledToFill ()
                .frame(width: 40, height: 40)
                .clipped()
                .cornerRadius (50)
                .overlay(
                RoundedRectangle (cornerRadius: 44)
                    .stroke (Color(.label), lineWidth: 1)
                )
                .shadow(radius: 5)
    
                VStack(alignment: .leading, spacing: 4) {
                    Text(RecentMessage.username)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(RecentMessage.text)
                        .font(.subheadline)
                        .foregroundColor(Auth.auth().currentUser?.uid == RecentMessage.fromUid ? .secondary: .primary)
                }
                
                Spacer()
                
                Text(dateFormatter.string(from: RecentMessage.timestamp.dateValue()))
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            
            Divider()
        }
    }
}

#Preview {
    RecentMessageCell(RecentMessage: RecentMessage(fromUid: " ", toUid: " ", username: "", profileImageUrl: " ", text: "", timestamp: Timestamp()))
}
