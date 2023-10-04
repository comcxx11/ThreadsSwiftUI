//
//  ContentViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import Combine
import FirebaseAuth

final class ContentViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] user in
            self?.userSession = user
        }
        .store(in: &cancellable)
    }
}
