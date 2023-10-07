//
//  CreateThreadViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/07.
//

import FirebaseAuth
import Firebase
import Combine

class CreateThreadViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var caption = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellable)
    }

    @MainActor
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 1)
        try await ThreadService.uploadThread(thread)
    }
}
