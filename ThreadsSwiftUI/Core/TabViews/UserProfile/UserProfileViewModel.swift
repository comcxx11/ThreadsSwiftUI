//
//  UserProfileViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import Foundation
import Combine

final class UserProfileViewModel: ObservableObject {
     
    @Published var currentUser: User?
    @Published var showEditProfile: Bool = false
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubcribers()
    }
    
    private func setupSubcribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user            
        }
        .store(in: &cancellable)
    }
    
    
}
