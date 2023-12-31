//
//  MessageViewModel.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/26.
//

import Foundation
import Firebase
import FirebaseAuth

class MessageViewModel: ObservableObject {
    var user: User?
    var currentUser: User
    
    @Published var messages = [Message]()
    @Published var newMessageText =  ""
    @Published var count = 0
    
    private var listenerRegistration: ListenerRegistration?
    
    init(user: User? = nil, currentUser: User) {
        self.user = user
        self.currentUser = currentUser
    }
    
    func sendNewMessage() {
        guard let selectedUserUid = user?.uid else {return}
        
        let newMessageData = [
            "fromId": currentUser.uid,
            "toId" : selectedUserUid,
            "text": newMessageText,
            "timestamp": Timestamp()
        ] as [String: Any]
        
        let messagesCollection = Firestore.firestore().collection("messages")
        
        messagesCollection
            .document(currentUser.uid)
            .collection(selectedUserUid)
            .addDocument(data: newMessageData) { error in
                if let error = error {
                    print("Failed to send message: \(error.localizedDescription)")
                }
                self.persistRecentMessage(fromUid: self.currentUser.uid, toUid: selectedUserUid, username: self.user?.username ?? "", profileImageUrl: self.user?.profileImageUrl ?? "" , text: self.newMessageText, timestamp: Timestamp())
                
                self.newMessageText = ""
                self.count += 1
            }
        messagesCollection
            .document(selectedUserUid)
            .collection(currentUser.uid)
            .addDocument(data: newMessageData) { error in
                if let error = error {
                    print("Failed to send message: \(error.localizedDescription)")
                }
                print("Message sent successfully to recipient")
       }
    }
    
    func fetchMessages() {
        guard let selectedUserUid = user?.uid else {return}
        
        let messagesQuery = Firestore.firestore().collection("messages")
            .document(currentUser.uid)
            .collection (selectedUserUid)
            .order (by: "timestamp")
        
        listenerRegistration = messagesQuery.addSnapshotListener { querySnapshot, error in
            
            guard let querySnapshot = querySnapshot else {
                print("Failed to fetch messages \(error?.localizedDescription ?? "Unkown error")")
                return
            }
            
            self.messages = querySnapshot.documents.map ({ snapshot in
            let data = snapshot.data ()
            let id = snapshot.documentID
            let fromId = data["fromId"] as! String
            let toId = data["toId"] as! String
            let text = data["text"] as! String
            let timestamp = data["timestamp" ] as! Timestamp
            let date = timestamp.dateValue()
                
                return Message(id: id, fromId: fromId, toId: toId, text: text, date: date)
    
            })
            self.count += 1
        }
    }
    
    func persistRecentMessage(fromUid: String, toUid: String, username: String, profileImageUrl: String, text: String, timestamp: Timestamp){
        
        let recentMessageData = [
            "fromUid": fromUid,
            "toUid": toUid,
            "username": username,
            "profileImageUrl": profileImageUrl,
            "text": text,
            "timestamp": timestamp
        ] as [String : Any] //Casting it to accommodate firebase format
        
        let recentMessagesCollection = Firestore.firestore().collection("recentMessages")
        
        recentMessagesCollection
            .document(fromUid)
            .collection("messages")
            .document(toUid)
            .setData(recentMessageData) { error in
                if let error = error {
                    print("Failed to persist message for sender \(error.localizedDescription)")
                }
            }
        
        let recipientMessageData = [
            "fromUid": fromUid,
            "toUid": toUid,
            "username": currentUser.username,
            "profileImageUrl": currentUser.profileImageUrl,
            "text": text,
            "timestamp": timestamp
        ] as [String : Any]
        
        recentMessagesCollection
            .document(fromUid)
            .collection("messages")
            .document(fromUid)
            .setData(recipientMessageData) { error in
                if let error = error {
                    print("Failed to persist message for recipient \(error.localizedDescription)")
                }
            }
    }
    
    func fetchUser(uid: String) async {
        do {
            let snapshot = try await Firestore.firestore()
                .collection("users")
                .document(uid)
                .getDocument()
            
            guard let user = try? snapshot.data(as: User.self) else {return}
            self.user = user
            fetchMessages()
            
        } catch {
            
            print("Error fetching user \(error.localizedDescription)")
        }
    }
    deinit {
        listenerRegistration?.remove()
    }
}
