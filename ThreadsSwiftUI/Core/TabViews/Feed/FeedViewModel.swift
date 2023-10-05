//
//  FeedViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import Foundation

enum FeedTabType: Int {
    case recommand
    case following
}

final class FeedViewModel: ObservableObject {
 
    @Published var selectedTab: FeedTabType = .recommand
}
