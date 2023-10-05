//
//  LoginViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var loginModel = LoginModel()
    @Published var showAlert = false
    var error: Error?
    
    @MainActor
    func login() async throws {
        do {
            try await AuthService.shared.login(withEmail: loginModel.email, password: loginModel.password)
        } catch {
            self.error = error
            self.showAlert = true
        }
    }
    
    func alertOkButtonTapped() {
        showAlert = false
        error = nil
        
    }
}
