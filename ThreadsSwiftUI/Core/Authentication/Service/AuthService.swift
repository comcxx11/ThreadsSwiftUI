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
    
    // インスタンス生成できないように privateをつける
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signout() {
        userSession = nil
    }
    
    func login(withEmail email: String, password: String) {
        
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, username: String) {
        
    }
    
    
}
