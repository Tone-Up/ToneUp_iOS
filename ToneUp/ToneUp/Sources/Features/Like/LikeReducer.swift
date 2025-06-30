//
//  LikeReducer.swift
//  ToneUp
//
//  Created by 전준영 on 5/22/25.
//

import SwiftUI
import ComposableArchitecture

struct Like: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var userTone: UserTone = .spring
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case tappedAnalyzeAgain
    }
    
    //    @Dependency(\.recommendationClient) var recommendationClient
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .tappedAnalyzeAgain:
                return .none
                
            case .binding:
                return .none
            }
        }
    }
    
}
