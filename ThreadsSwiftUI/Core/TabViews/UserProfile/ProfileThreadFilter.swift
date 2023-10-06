//
//  ProfileThreadFilter.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: "スレッド"
        case .replies: "返信"
        }
    }
    
    var id: Int { self.rawValue }
}
