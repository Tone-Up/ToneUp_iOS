//
//  AppFeature.swift
//  ToneUp
//
//  Created by 전준영 on 7/4/25.
//

import ComposableArchitecture

@Reducer
struct AppFeature: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var selectedTab: TabComponent = .home
        var chatBot: Like.State = .init()
        var chatList: Like.State = .init()
        var home: Home.State = .init()
        var like: Like.State = .init()
        var profile: Profile.State = .init()
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case tabChanged(TabComponent)
        case chatBot(Like.Action)
        case chatList(Like.Action)
        case home(Home.Action)
        case like(Like.Action)
        case profile(Profile.Action)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Scope(state: \.chatBot, action: \.chatBot) { Like() }
        Scope(state: \.chatList, action: \.chatList) { Like() }
        Scope(state: \.home, action: \.home) { Home() }
        Scope(state: \.like, action: \.like) { Like() }
        Scope(state: \.profile, action: \.profile) { Profile() }
        
        Reduce { state, action in
            switch action {
            case .tabChanged(let tab):
                state.selectedTab = tab
                return .none
                
            default:
                return .none
            }
        }
    }
    
}
