//
//  UserContentListView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI

struct UserContentListView: View {
    
    @StateObject var viewModel: UserContentListViewModel
    @Namespace var animation
    
    init(user: User?) {
        _viewModel = .init(wrappedValue: UserContentListViewModel(user: user))
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(viewModel.selectedFilter == filter ? .black : .gray)
                        
                        Group {
                            if viewModel.selectedFilter == filter {
                                Capsule()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .matchedGeometryEffect(id: "PROFILE_FILTER", in: animation)
                                    .opacity(viewModel.selectedFilter == filter ? 1 : 0)
                                
                            } else {
                                Capsule()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .opacity(viewModel.selectedFilter == filter ? 1 : 0)
                            }
                        }
                        .padding(.horizontal, 14)
                        
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            viewModel.selectedFilter = filter
                        }
                    }
                }
            }
            .overlay(
                Divider()
                , alignment: .bottom
            )
            
            LazyVStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
        }
    }
}

#Preview {
    UserContentListView(user: PreviewProvider.shared.user)
}
