//
//  RecommandAPI.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation
import Moya

enum RecommandAPI {
    case recommandProduct(colorType: String,
                          query: RecommandQueryParameters)
}

extension RecommandAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case let .recommandProduct(colorType, _):
            return "/api/product/recommandation/\(colorType)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommandProduct:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .recommandProduct(_, query):
            return .requestParameters(parameters: query.asQueryItems(),
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .recommandProduct:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value,
                    Header.authorization.key: Header.authorization.value]
        }
    }
}
