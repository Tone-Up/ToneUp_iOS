//
//  ProfileReducer.swift
//  ToneUp
//
//  Created by 전준영 on 6/30/25.
//

import SwiftUI
import ComposableArchitecture

struct Profile: Reducer {
    
    @ObservableState
    struct State: Equatable {
        //내 프로필 세팅
        var profile: ProfileDTO? = nil
        var isLoading: Bool = false
        //내 프로필 관리 버튼
        var isProfileSettingButtonTap: Bool = false
        //내 게시물 세팅
        //내 스타일 세팅
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onAppear
        case profileSettingButtonTapped
        case profileResponse(TaskResult<ProfileDTO>)
    }
    
    @Dependency(\.profileClient) var profileClient
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .onAppear:
                state.isLoading = true
                return .run { send in
                    await send(
                        .profileResponse(
                            TaskResult { try await profileClient.myProfile() }
                        )
                    )
                }
                
            case .profileSettingButtonTapped:
                state.isProfileSettingButtonTap = true
                return .none
                
            case .profileResponse(.success(let dto)):
                state.isLoading = false
                state.profile = dto
                return .none
                
            case .profileResponse(.failure):
                state.isLoading = false
                return .none
            }
            
        }
    }
    
}
