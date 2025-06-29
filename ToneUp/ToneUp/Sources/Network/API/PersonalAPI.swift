//
//  PersonalAPI.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import Foundation
import Moya

enum PersonalAPI {
    case personalAnalysis(body: PersonalAnalysisBody)
}

extension PersonalAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .personalAnalysis:
            return "/api/personalcolor"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .personalAnalysis:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .personalAnalysis(body):
            return .uploadMultipart(body.toMultipartFormData())
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .personalAnalysis:
            return [Header.contentTypeMulti.key: Header.contentTypeMulti.value,
                    Header.authorization.key: Header.authorization.value]
        }
    }
}
