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
            ForEach(1...5, id:\.self) { _ in
                ThreadCell()
            }
        }
    }
}

#Preview {
    FeedRecommendView()
}
