//
//  RootView.swift
//  ToneUp
//
//  Created by 전준영 on 7/4/25.
//

import SwiftUI
import ComposableArchitecture
import GoogleSignIn

struct RootView: View {
    
    let store: StoreOf<AppReducer>
    @ObservedObject private var viewStore: ViewStoreOf<AppReducer>
    
    init(store: StoreOf<AppReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        Group {
            switch viewStore.route {
            case .onboarding:
                OnboardingView(store: store.scope(state: \.onboarding,
                                                  action: \.onboarding))
                
            case .analyze:
                AnalyzeView(store: store.scope(state: \.analyze,
                                               action: \.analyze)
                )
                
            case .mainTab:
                CustomTabView(store: store.scope(state: \.mainTab,
                                                 action: \.mainTab))
            }
        }
        .onAppear { viewStore.send(.onAppear) }
        .onOpenURL { url in
            GIDSignIn.sharedInstance.handle(url)
        }
    }
    
}
