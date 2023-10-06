//
//  MainTabView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct MainTabView: View {
    
    enum TabType: Int {
        case feed = 0
        case explore
        case createThread
        case activity
        case profile
    }
    
    @State private var selectedTab: TabType = .feed
    @State private var beforeSelectedTab: TabType = .feed
    @State private var showCreateThreadView = false

    var body: some View {
       
        TabView(selection: $selectedTab) {
            
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == .feed ? "house.fill" : "house")
                }
                .onAppear { selectedTab = .feed }
                .tag(TabType.feed)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear { selectedTab = .explore }
                .tag(TabType.explore)
            
            Color.clear
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = .createThread }
                .tag(TabType.createThread)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == .activity ? "heart.fill" : "heart")
                }
                .onAppear { selectedTab = .activity }
                .tag(TabType.activity)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == .profile ? "person.fill" : "person")
                }
                .onAppear { selectedTab = .profile }
                .tag(TabType.profile)
        }
        .onChange(of: selectedTab) { before, after in
            beforeSelectedTab = before
            showCreateThreadView = after == .createThread
        }
        .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = beforeSelectedTab
        }, content: {
            CreateThreadView()
        })
    }
}

#Preview {
    MainTabView()
}
