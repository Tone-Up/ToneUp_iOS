//
//  TokenAPI.swift
//  ToneUp
//
//  Created by 전준영 on 5/29/25.
//

import Foundation
import Moya

enum TokenAPI {
    case token(body: TokenRequestBody)
}

extension TokenAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .token:
            return "/api/auth/refresh"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .token:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .token(body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .token:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value]
        }
    }
}
