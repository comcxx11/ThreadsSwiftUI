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
}
