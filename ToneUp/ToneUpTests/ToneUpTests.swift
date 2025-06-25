//
//  ToneUpTests.swift
//  ToneUpTests
//
//  Created by 전준영 on 5/12/25.
//

import ComposableArchitecture
import Testing
@testable import ToneUp

struct ToneUpTests {
    
    @MainActor
    @Test
    func onboardingGoogleLoginFlowSucceeds() async throws {
        let dummyUser = User(
            id: 123,
            nickname: "junyoung",
            accessToken: "at",
            refreshToken: "rt"
        )
        
        var store = TestStore(
            initialState: Onboarding.State(),
            reducer: Onboarding.init
        ) {
            $0.authClient = AuthClient(login: { _ in dummyUser })
        }
        
        await store.send(.loginButtonTapped) {
            $0.isLoginSheetPresented = true
        }
        
        await store.send(.loginOptionSelected(.google)) {
            $0.isLoginSheetPresented = false
        }
        
        await store.receive(
          { action in
            if case .loginResponse(.success) = action { return true }
            return false
          }
        )
    }
    
}
