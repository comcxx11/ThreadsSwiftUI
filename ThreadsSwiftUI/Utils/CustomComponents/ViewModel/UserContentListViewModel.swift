//
//  UserContentListViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/07.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    
    let user: User?
    @Published var threads = [Thread]()
    @Published var selectedFilter: ProfileThreadFilter = .threads

    init(user: User?) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        guard let uid = user?.id else { return }
        do {
            self.threads = try await ThreadService.fetchUserThreads(uid: uid)
            try await fetchThreadUser(uid)
        } catch {
            print("Faild fetchUserThreads: \(error.localizedDescription)")
        } 
    }
    
    @MainActor
    private func fetchThreadUser(_ uid: String) async throws {
        for i in 0 ..< threads.count {
            let ownerId = threads[i].ownerUid
            
            // 自分のThreadの場合にはfetch必要なし
            if ownerId == uid {
                threads[i].user = user
            } else{
                let user = try await UserService.shared.fetchUser(withUid: ownerId)
                threads[i].user = user
            }
        }
    }
}
