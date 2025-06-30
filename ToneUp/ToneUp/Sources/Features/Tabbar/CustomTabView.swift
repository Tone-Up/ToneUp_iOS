//
//  CustomTabView.swift
//  ToneUp
//
//  Created by 전준영 on 6/29/25.
//

import SwiftUI
import ComposableArchitecture

struct CustomTabView: View {
    
    @State private var selection: TabComponent = .home
    
    init() {
        UITabBar.appearance().scrollEdgeAppearance = .init()
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Group {
                NavigationStack {
                    ProfileView(isMine: true)
                }
                .tabItem{
                    TabButton(selectedTab: $selection,
                              tabType: .chatBot)
                }
                .tag(TabComponent.chatBot)
                
                NavigationStack {
                    ChatListView()
                }
                .tabItem{
                    TabButton(selectedTab: $selection,
                              tabType: .chatting)
                }
                .tag(TabComponent.chatting)
                
                NavigationStack {
                    HomeView(store: Store(initialState: Home.State()) {
                        Home()
                    })
                }
                .tabItem{
                    TabButton(selectedTab: $selection,
                              tabType: .home)
                }
                .tag(TabComponent.home)
                
                NavigationStack {
                    LikedView(store: Store(initialState: Like.State()) {
                        Like()
                    })
                }
                .tabItem{
                    TabButton(selectedTab: $selection,
                              tabType: .like)
                }
                .tag(TabComponent.like)
                
                NavigationStack {
                    ProfileView(isMine: true)
                }
                .tabItem{
                    TabButton(selectedTab: $selection,
                              tabType: .profile)
                }
                .tag(TabComponent.profile)
            }
        }
        .tint(.black)
    }
    
}

struct TabButton: View {
    
    @Binding var selectedTab: TabComponent
    let tabType: TabComponent
    
    var body: some View {
        Button(action: {
            selectedTab = tabType
        }) {
            VStack(spacing: 4) {
                Image(systemName: tabType.icon)
                    .font(.system(size: 24))
                
                Text(tabType.title)
                    .font(.caption)
            }
        }
    }
    
}

enum TabComponent: Int, CaseIterable {
    case chatBot
    case chatting
    case home
    case like
    case profile
    
    var title: String {
        switch self {
        case .chatBot:
            return "챗봇"
            
        case .chatting:
            return "채팅"
            
        case .home:
            return "홈"
            
        case .like:
            return "좋아요"
            
        case .profile:
            return "마이"
        }
    }
    
    var icon: String {
        switch self {
        case .chatBot:
            return "b.circle"
            
        case .chatting:
            return "message"
            
        case .home:
            return "house"
            
        case .like:
            return "heart"
            
        case .profile:
            return "person"
        }
    }
}

#Preview {
    CustomTabView()
}
