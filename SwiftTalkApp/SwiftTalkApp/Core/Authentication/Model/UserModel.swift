//
//  UserModel.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/26.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String {
        uid
    }
    
    let uid:String
    var email: String
    var username: String
    var profileImageUrl: String

}

let users = [
    User(uid: "1", email: "user1@example.com", username: "User One", profileImageUrl: "https://i.pravatar.cc/150?img=1"),
    User(uid: "2", email: "user2@example.com", username: "User Two", profileImageUrl: "https://i.pravatar.cc/150?img=2"),
    User(uid: "3", email: "user3@example.com", username: "User Three", profileImageUrl: "https://i.pravatar.cc/150?img=3"),
    User(uid: "4", email: "user4@example.com", username: "User Four", profileImageUrl: "https://i.pravatar.cc/150?img=4"),
    User(uid: "5", email: "user5@example.com", username: "User Five", profileImageUrl: "https://i.pravatar.cc/150?img=5"),
    User(uid: "6", email: "user6@example.com",username:  "User Six", profileImageUrl: "https://i.pravatar.cc/150?img=6"),
    User(uid: "7", email: "user7@example.com", username: "User Seven", profileImageUrl: "https://i.pravatar.cc/150?img=7"),
    User(uid: "8", email: "user8@example.com", username: "User Eight", profileImageUrl: "https://i.pravatar.cc/150?img=8"),
    User(uid: "9", email: "user9@example.com" , username: "User Nine", profileImageUrl: "https://i.pravatar.cc/150?img=9"),
    User(uid:"10",email: "user10@example.com", username: "User Ten", profileImageUrl: "https://i.pravatar.cc/150?img=10")
]
