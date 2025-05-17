//
//  AuthClient.swift
//  ToneUp
//
//  Created by 전준영 on 5/17/25.
//

import Foundation
import Dependencies

struct AuthClient {
    var login: (LoginOption) async throws -> User
}

extension DependencyValues {
    var authClient: AuthClient {
        get { self[AuthClientKey.self] }
        set { self[AuthClientKey.self] = newValue }
    }
    
    private enum AuthClientKey: DependencyKey {
        static let liveValue = AuthClient(
            login: { option in
                print("Login with \(option)")
                return User(id: "user123")
            }
        )
        
        static let testValue = AuthClient(
            login: { _ in User(id: "test-user") }
        )
    }
}
