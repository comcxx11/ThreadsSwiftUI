//
//  ContentView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: ContentViewModel
    
    init() {
        _viewModel = .init(wrappedValue: ContentViewModel())
    }
    
    var body: some View {
        // AuthService.userSessionの値を監視しているので
        // 変更タイミングでここのViewが更新される
        if $viewModel.userSession != nil {
            MainTabView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
