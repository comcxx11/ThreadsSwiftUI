//
//  UserService.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserService {
    
    static let shared = UserService()
    
    @Published var currentUser: User?
    
    private init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    func reset() {
        currentUser = nil
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    @MainActor
    func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    @MainActor
    func fetchAllUsers() async throws -> [User] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self) }
        return users.filter { $0.id != uid } // 自分以外のすべてのユーザーを返却
        
    }
     
    @MainActor
    func updateUserData(withProfileImageUrl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageUrl])
        
        // 正常にuploadが終わったら newImageUrlで 画像更新するようにTriggerさせる
        self.currentUser?.profileImageUrl = imageUrl
    }
}
