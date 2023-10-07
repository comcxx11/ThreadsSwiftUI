//
//  FeedRecommendView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import SwiftUI

struct FeedRecommendView: View {
    
    @StateObject var viewModel: FeedRecommendViewModel
    
    init() {
        _viewModel = .init(wrappedValue: FeedRecommendViewModel())
    }

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .refreshable {
            Task { try await viewModel.fetchThreads() }
        }
    }
}

#Preview {
    FeedRecommendView()
}
