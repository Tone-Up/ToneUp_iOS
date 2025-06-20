//
//  SearchAPI.swift
//  ToneUp
//
//  Created by 전준영 on 6/1/25.
//

import Foundation
import Moya

enum SearchAPI {
    case search(query: QueryParameters)
}

extension SearchAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/api/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .search(query):
            return .requestParameters(parameters: query.asQueryItems(),
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .search:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value,
                    Header.authorization.key: Header.authorization.value]
        }
    }
}
