//
//  OAuthAPI.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation
import Moya

enum OAuthAPI {
    case googleLogin(body: SocialRequestBody)
}

extension OAuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .googleLogin:
            return "/api/auth/social-login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .googleLogin:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .googleLogin(body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .googleLogin:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value]
        }
    }
}
