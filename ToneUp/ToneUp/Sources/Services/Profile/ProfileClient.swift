//
//  ProfileClient.swift
//  ToneUp
//
//  Created by 전준영 on 6/30/25.
//

import Foundation
import Dependencies

struct ProfileClient {
    var myProfile: () async throws -> ProfileDTO
}

enum ProfileClientClientKey: DependencyKey {
    static let liveValue: ProfileClient = ProfileClient (
        myProfile: {
            let provider = NetworkProvider<UserAPI>()
            let response = try await provider.request(
                .getMyProfile,
                decodingType: ServerResponse<ProfileDTO>.self
            )
            
            guard let profileDTO = response.data else {
                throw ProfileError.missingData
            }
            
            return profileDTO
        }
    )
    
    static let previewValue = ProfileClient(
        myProfile: {
            ProfileDTO(
                userId: 1000,
                nickname: "JJUN",
                profileImageUrl: "https://example.com/avatar.png",
                bio: "제 자기소개입니다."
            )
        }
    )
    
    static let testValue = previewValue
    
}

extension DependencyValues {
    var profileClient: ProfileClient {
        get { self[ProfileClientClientKey.self] }
        set { self[ProfileClientClientKey.self] = newValue }
    }
}
