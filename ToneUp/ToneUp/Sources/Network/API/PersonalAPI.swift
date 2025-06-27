//
//  PersonalAPI.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import Foundation
import Moya

enum PersonalAPI {
    case getMyProfile
    case getOpponentProfile(opponentUserId: Int)
    case updateMyProfile(body: UpdateMyProfileRequestBody)
    case updateMyProfileImage(body: UpdateMyImageRequestBody)
    //    case withdrawal(userId: Int,
    //                    body: WithdrawalRequestBody)
}

extension PersonalAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getMyProfile:
            return "/api/profiles/me"
            
        case let .getOpponentProfile(opponentUserId):
            return "/api/profiles/\(opponentUserId)"
            
        case .updateMyProfile:
            return "/api/profiles"
            
        case .updateMyProfileImage:
            return "/api/profiles/image"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyProfile, .getOpponentProfile:
            return .get
            
        case .updateMyProfile, .updateMyProfileImage:
            return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .getMyProfile, .getOpponentProfile:
            return .requestPlain
            
        case let .updateMyProfile(body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
            
        case let .updateMyProfileImage(body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getMyProfile, .getOpponentProfile,
                .updateMyProfile, .updateMyProfileImage:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value,
                    Header.authorization.key: Header.authorization.value]
        }
    }
}
