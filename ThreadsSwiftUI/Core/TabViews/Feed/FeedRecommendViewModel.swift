//
//  FeedRecommendViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import Foundation

final class FeedRecommendViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    init() {
        Task {
            try await fetchThreads()
            
        }
    }
    
    @MainActor
    func fetchThreads() async throws {
        do {
            self.threads = try await ThreadService.fetchThreads()
            try await fetchUserDataForThreads()
        } catch {
            print("Faild fetchThreads : \(error.localizedDescription)")
        }
    }
    
    // Publisherに代入するのでこのメソッドにも@MainActorをつけるべき。
    @MainActor
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let ownerUid = threads[i].ownerUid
            let threadUser = try await UserService.shared.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
