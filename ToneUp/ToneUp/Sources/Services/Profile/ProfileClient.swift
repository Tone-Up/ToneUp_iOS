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
    var updateProfile: (_ nickname: String, _ bio: String) async throws -> Void
}

enum ProfileClientClientKey: DependencyKey {
    static let liveValue: ProfileClient = ProfileClient (
        myProfile: {
            let provider = NetworkProvider<UserAPI>()
            let response = try await provider.request(
                .getMyProfile,
                decodingType: ProfileDTO.self
            )
            
//            guard let profileDTO = response.data else {
//                throw ProfileError.missingData
//            }
            
            return response
        },
        updateProfile: { nickname, bio in
            let provider = NetworkProvider<UserAPI>()
            let body = UpdateMyProfileRequestBody(nickname: nickname, bio: bio, profilImageUrl: nil)
            _ = try await provider.request(
                .updateMyProfile(body: body),
                decodingType: EmptyResponse.self
            )
        }
    )
    
    static let previewValue = ProfileClient(
        myProfile: {
            ProfileDTO(
                userId: 1000,
                nickname: "JJUN",
                personalColor: "ATUMN",
                profileImageUrl: "https://example.com/avatar.png",
                bio: "제 자기소개입니다.",
                follower: 10,
                following: 10
            )
        }, updateProfile: { nickname, bio in 
            
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
