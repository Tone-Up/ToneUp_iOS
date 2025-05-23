//
//  HomeReducer.swift
//  ToneUp
//
//  Created by 전준영 on 5/18/25.
//

import SwiftUI
import ComposableArchitecture

struct Home: Reducer {
    
    @ObservableState
    struct State {
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


enum UserTone: String {
    case spring = "봄웜"
    case summer = "여름쿨"
    case autumn = "가을웜"
    case winter = "겨울쿨"
    
    var color: Color {
        switch self {
        case .spring: return .pink
        case .summer: return .blue
        case .autumn: return .orange
        case .winter: return .cyan
        }
    }
}
