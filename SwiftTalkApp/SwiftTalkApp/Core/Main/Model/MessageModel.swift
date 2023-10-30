//
//  MessageModel.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/26.
//

import Foundation

struct Message: Identifiable {
    
    let id: String
    let fromId: String //User current UID
    let toId: String  // send to
    let text: String
    let date: Date
}
