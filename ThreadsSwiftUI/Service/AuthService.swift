//
//  AuthService.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var error: Error?
    
    // インスタンス生成できないように privateをつける
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signout() {
        try? Auth.auth().signOut()
        userSession = nil
        UserService.shared.reset()
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws  {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
        // ユーザーデータを取得
        try await UserService.shared.fetchCurrentUser()
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        
        // 1. ユーザーをFirebaseAuthに登録
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        
        //登録した userデータ(email, id) + 追加情報(fullname, username)をもって Firestore.usersに登録
        try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String, fullname: String, username: String, id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        // 完了後、UserServiceにセット
        UserService.shared.currentUser = user
    }
}
