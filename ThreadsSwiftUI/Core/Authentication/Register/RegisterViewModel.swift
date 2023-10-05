//
//  RegisterViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var model = RegisterModel()
    @Published var showAlert = false
    var error: Error?
    
    // MARK: - From View
    
    @MainActor
    func createUser() async throws {
        do {
            try await AuthService.shared.createUser(withEmail: model.email,
                                                    password: model.password,
                                                    fullname: model.fullName,
                                                    username: model.username)
        } catch {
            self.error = error
            self.showAlert = true
            print("DEBUG: Faild to create User: \(error.localizedDescription)")
        }
    }
    
    func alertOkButtonTapped() {
        showAlert = false
        error = nil
    }
}
