//
//  UserProfileViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import Foundation

final class UserProfileViewModel: ObservableObject {
 
    @Published var selectedFilter: ProfileThreadFilter = .threads
}
