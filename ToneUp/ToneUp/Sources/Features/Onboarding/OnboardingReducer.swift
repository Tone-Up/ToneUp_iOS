//
//  OnboardingReducer.swift
//  ToneUp
//
//  Created by 전준영 on 5/17/25.
//

import SwiftUI
import ComposableArchitecture

struct Onboarding: Reducer {
    
    @ObservableState
    struct State {
        var isLoginSheetPresented = false
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped
        case loginOptionSelected(LoginOption)
        case loginResponse(Result<User, AuthError>)
    }

    @Dependency(\.authClient) var authClient

    var body: some ReducerOf<Self> {
        BindingReducer()

        Reduce { state, action in
            switch action {
            case .loginButtonTapped:
                state.isLoginSheetPresented = true
                return .none

            case .loginOptionSelected(let option):
                state.isLoginSheetPresented = false
                return .run { send in
                    do {
                        let user = try await authClient.login(option)
                        await send(.loginResponse(.success(user)))
                    } catch {
                        await send(.loginResponse(.failure(.network(error))))
                    }
                }

            case .loginResponse:
                return .none

            case .binding:
                return .none
            }
        }
    }
    
}
