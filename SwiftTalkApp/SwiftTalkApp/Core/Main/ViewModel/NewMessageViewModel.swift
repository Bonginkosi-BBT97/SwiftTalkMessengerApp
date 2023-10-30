//
//  NewMessageViewModel.swift
//  SwiftTalkApp
//
//  Created by Bonginkosi Tshabalala on 2023/10/26.
//

import Foundation
import FirebaseAuth
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    
    init() {
        Task {
            await fetchAllUser()
        }
    }
    @MainActor
    func fetchAllUser() async {
        do {
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            let users = snapshot.documents.compactMap({ try? $0.data(as: User.self)})
            
            for user in users {
                if user.uid != Auth.auth().currentUser?.uid {
                    self.users.append(user)
                }
            }
        } catch {
            print("Failed to get users")
        }
    }
}
