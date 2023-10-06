//
//  UserProfileView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject var viewModel: UserProfileViewModel
    @Namespace var animation
    
    init() {
        _viewModel = .init(wrappedValue: UserProfileViewModel())
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            header
                .padding(.horizontal)
                .padding(.bottom, 20)
            
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
            }
            .overlay(
                Divider()
                , alignment: .bottom
            )
            
            LazyVStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(1...10, id:\.self) { _ in
                        ThreadCell()
                    }
                }
            }
        }
    }
    
}

extension UserProfileView {
    
    var header: some View {
        VStack(spacing: 14 ) {
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Johnny FPV")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Johnny Schaer")
                            .font(.subheadline)
                    }
                    
                    Text("Best FPV Drone pilot in the world")
                        .font(.footnote)
                    
                    Text("フォロワー50万人")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                CircluarProfileImageView(dummyImage: "johnnyfpv", showFollowButton: false)
            }
            
            Button {
                
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background(.black)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    UserProfileView()
}
