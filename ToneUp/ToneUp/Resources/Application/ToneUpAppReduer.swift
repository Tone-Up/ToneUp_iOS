//
//  ToneUpAppReduer.swift
//  ToneUp
//
//  Created by 전준영 on 7/4/25.
//

import SwiftUI
import ComposableArchitecture

enum AppRoute: Equatable {
    case onboarding, analyze, mainTab
}

@Reducer
struct AppReducer {
    
    @ObservableState
    struct State: Equatable {
        var route: AppRoute = .onboarding
        var onboarding = Onboarding.State()
        var analyze = Analyze.State()
        var mainTab = AppFeature.State()
    }
    
    enum Action {
        case onAppear
        case routeChanged(AppRoute)
        case onboarding(Onboarding.Action)
        case analyze(Analyze.Action)
        case mainTab(AppFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        
        Scope(state: \.onboarding, action: \.onboarding) { Onboarding() }
        Scope(state: \.analyze, action: \.analyze) { Analyze() }
        Scope(state: \.mainTab, action: \.mainTab) { AppFeature() }
        
        Reduce { state, action in
            switch action {
            case .onAppear:
              return .run { send in
                let hasToken    = KeychainManager.load(forKey: .accessToken) != nil
                let signedUpStr = KeychainManager.load(forKey: .signedUp)
                let signedUp    = signedUpStr == "true"
                let personalStr = KeychainManager.load(forKey: .personalComplete)
                let personalOK  = personalStr == "true"

                let next: AppRoute
                if !hasToken || !signedUp {
                  next = .onboarding
                } else if !personalOK {
                  next = .analyze
                } else {
                  next = .mainTab
                }

                await send(.routeChanged(next))
              }
                
            case .routeChanged(let route):
                state.route = route
                return .none
                
            case .onboarding(.loginResponse(.success)):
//                return .run { send in await send(.routeChanged(.analyze)) }
                return .run { send in
                    let personalOK = KeychainManager.load(forKey: .personalComplete) == "true"
                    let next: AppRoute = personalOK ? .mainTab : .analyze
                    await send(.routeChanged(next))
                }
                
            case .analyze(.analysisResponse(.success)):
                return .run { send in await send(.routeChanged(.mainTab)) }
                
            default:
                return .none
            }
        }
    }
    
}
