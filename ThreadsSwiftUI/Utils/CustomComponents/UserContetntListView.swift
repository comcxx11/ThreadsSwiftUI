//
//  UserContetntListView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI

struct UserContetntListView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(selectedFilter == filter ? .black : .gray)
                        
                        Group {
                            if selectedFilter == filter {
                                Capsule()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .matchedGeometryEffect(id: "PROFILE_FILTER", in: animation)
                                    .opacity(selectedFilter == filter ? 1 : 0)
                                
                            } else {
                                Capsule()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .opacity(selectedFilter == filter ? 1 : 0)
                            }
                        }
                        .padding(.horizontal, 14)
                        
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedFilter = filter
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
                    ForEach(1...5, id:\.self) { _ in
                        ThreadCell()
                    }
                }
            }
        }
    }
}

#Preview {
    UserContetntListView()
}
