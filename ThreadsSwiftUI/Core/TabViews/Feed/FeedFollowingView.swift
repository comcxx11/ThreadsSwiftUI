//
//  FeedFollowingView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import SwiftUI

struct FeedFollowingView: View {
    
    @StateObject var viewModel: FeedFollowingViewModel
    
    init() {
        _viewModel = .init(wrappedValue: FeedFollowingViewModel())
    }

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(1...5, id:\.self) { _ in
                ThreadCell()
            }
        }
    }
}

#Preview {
    FeedFollowingView()
}
