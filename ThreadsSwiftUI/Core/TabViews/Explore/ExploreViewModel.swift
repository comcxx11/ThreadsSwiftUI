//
//  ExploreViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    
    @Published var users: [User] = [.init(id: "id1", fullname: "Elon Musk", email: "elon.musk@x.com", username: "Elon Musk")]
}
