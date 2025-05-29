//
//  NetworkProviderClient.swift
//  ToneUp
//
//  Created by 전준영 on 5/28/25.
//

import Foundation
import Dependencies

struct NetworkProviderClient {
    var googleLogin: (_ token: String) async throws -> UserDTO
}

enum NetworkProviderClientKey: DependencyKey {
    static let liveValue: NetworkProviderClient = NetworkProviderClient(
        googleLogin: { token in
            let provider = NetworkProvider<OAuthAPI>()
            let body = SocialRequestBody(provider: "GOOGLE", token: token)
            let response = try await provider.request(
                .googleLogin(body: body),
                decodingType: ServerResponse<UserDTO>.self
            )

            guard let user = response.data else {
                throw AuthError.tokenMissing
            }

            return user
        }
    )
}

extension DependencyValues {
    var networkProviderClient: NetworkProviderClient {
        get { self[NetworkProviderClientKey.self] }
        set { self[NetworkProviderClientKey.self] = newValue }
    }
}
