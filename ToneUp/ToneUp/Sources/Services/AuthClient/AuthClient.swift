//
//  AuthClient.swift
//  ToneUp
//
//  Created by 전준영 on 5/17/25.
//

import Foundation
import GoogleSignIn
import Dependencies

struct AuthClient {
    var login: (_ option: LoginOption) async throws -> User
}

extension DependencyValues {
    var authClient: AuthClient {
        get { self[AuthClientKey.self] }
        set { self[AuthClientKey.self] = newValue }
    }
    
    private enum AuthClientKey: DependencyKey {
        static let liveValue: AuthClient = {
            @Dependency(\.networkProviderClient) var networkProviderClient
            
            return AuthClient(
                login: { option in
                    switch option {
                    case .google:
                        let (result, idToken) = try await performGoogleSignIn()
                        
                        let userDTO = try await networkProviderClient.googleLogin(idToken)
                        
                        guard let userId = userDTO.userId,
                              let nickname = userDTO.nickname,
                              let accessToken = userDTO.accessToken,
                              let refreshToken = userDTO.refreshToken else {
                            throw AuthError.tokenMissing
                        }
                        
                        return User(
                            id: userId,
                            nickname: nickname,
                            accessToken: accessToken,
                            refreshToken: refreshToken
                        )
                        
                    default:
                        throw AuthError.unsupportedProvider
                    }
                }
            )
        }()
    }
}

@MainActor
func performGoogleSignIn() async throws -> (GIDSignInResult, String) {
    guard let rootVC = UIApplication.shared
        .connectedScenes
        .compactMap({ $0 as? UIWindowScene })
        .first?.windows.first?.rootViewController else {
        throw AuthError.unknown
    }
    
    let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootVC)
    
    guard let idToken = result.user.idToken?.tokenString else {
        throw AuthError.tokenMissing
    }
    
    return (result, idToken)
}
