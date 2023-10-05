//
//  FeedView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel: FeedViewModel
    
    @Namespace var animation
    
    init() {
        _viewModel = .init(wrappedValue: FeedViewModel())
    }

    var body: some View {
        NavigationStack {
            
            VStack(spacing: 0) {
                
                VStack(spacing: 0) {
                    
                    appIconSmall
                    
                    tabButton
                }
                .overlay(
                    ZStack {
                        tabViewUnderline
                        Divider()
                    }
                    , alignment: .bottom)
                
                TabView(selection: $viewModel.selectedTab) {
                    FeedRecommendView()
                        .tag(FeedTabType.recommand)
                    FeedFollowingView()
                        .tag(FeedTabType.following)
                }
                .tabViewStyle(.page)
            }
            .animation(.interpolatingSpring, value: viewModel.selectedTab)
        }
    }
}

extension FeedView {
    
    var tabButton: some View {
        HStack(spacing: 0) {
            
            Button {
                viewModel.selectedTab = .recommand
            } label: {
                Text("おすすめ")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .foregroundColor(.primary.opacity(viewModel.selectedTab == .recommand ? 1 : 0.3))
            }
            
            Button {
                viewModel.selectedTab = .following
            } label: {
                Text("フォロー中")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .foregroundColor(.primary.opacity(viewModel.selectedTab == .following ? 1 : 0.3))
            }
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundColor(.primary)
    }
    
    var tabViewUnderline: some View {
        HStack {
            if viewModel.selectedTab == .recommand {
                Capsule()
                    .frame(height: 1)
                    .padding(.horizontal)
                    .matchedGeometryEffect(id: "FEED_TAB", in: animation)
                
                Capsule()
                    .frame(height: 1)
                    .padding(.horizontal)
                    .opacity(0)
                
            } else {
                Capsule()
                    .frame(height: 0)
                    .padding(.horizontal)
                
                Capsule()
                    .frame(height: 1)
                    .padding(.horizontal)
                    .matchedGeometryEffect(id: "FEED_TAB", in: animation)
            }
        }
    }
}

#Preview {
    FeedView()
}
