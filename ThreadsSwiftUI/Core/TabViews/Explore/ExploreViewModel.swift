//
//  ExploreViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    
    @Published var users: [User] = []
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    private func fetchAllUsers() async throws {
        self.users = try await UserService.shared.fetchAllUsers()
    }
}
