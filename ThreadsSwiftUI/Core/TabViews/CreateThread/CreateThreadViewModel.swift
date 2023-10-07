//
//  CreateThreadViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/07.
//

import Foundation

class CreateThreadViewModel: ObservableObject {
    let currentUser = UserService.shared.currentUser
    @Published var caption = ""
}
