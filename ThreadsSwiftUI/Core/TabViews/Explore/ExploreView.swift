//
//  ExploreView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel: ExploreViewModel
    
    init() {
        _viewModel = .init(wrappedValue: ExploreViewModel())
    }
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(1...10, id:\.self) { _ in
                    NavigationLink(value: viewModel.users[0]) {
                        UserCell()
                            .navigationBarBackButtonHidden()
                    }
                }
            }
            .padding(.horizontal, 4)
            .searchable(text: $viewModel.searchText, prompt: "検索")
            .navigationDestination(for: User.self) { user in
                UserProfileView()
            }
           
        }
    }
}

#Preview {
    ExploreView()
}
