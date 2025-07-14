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
    struct State: Equatable {
        var isLoginSheetPresented = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped
        case loginOptionSelected(LoginOption)
        //        case loginResponse(Result<User, AuthError>)
        case loginResponse(TaskResult<User>)
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
                //                return .run { send in
                //                    do {
                //                        let user = try await authClient.login(option)
                //                        await send(.loginResponse(.success(user)))
                //                    } catch {
                //                        await send(.loginResponse(.failure(.network(error))))
                //                    }
                //                }
                return .run { send in
                    await send(
                        .loginResponse(
                            TaskResult { try await authClient.login(option) }
                        )
                    )
                }
                
            case .loginResponse(.failure(_)):
                print("error")
                return .none
                
            case .loginResponse(.success(let user)):
                print("user: \(user)")
                return .run { _ in
                    KeychainManager.save(user.accessToken, forKey: .accessToken)
                    KeychainManager.save(user.refreshToken, forKey: .refreshToken)
                    KeychainManager.save("\(user.id)", forKey: .userID)
                    KeychainManager.save("\(user.signedUp)", forKey: .signedUp)
                  }
                
            case .binding:
                return .none
            }
        }
    }
    
}
