//
//  LikeAPI.swift
//  ToneUp
//
//  Created by 전준영 on 6/1/25.
//

import Foundation
import Moya

enum LikeAPI {
    case productLike(productId: Int)
    case feedLike(feedId: Int)
    case getFeedLike(query: QueryParameters)
    case getProductLike(query: QueryParameters)
}

extension LikeAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case let .productLike(productId):
            return "/api/products/\(productId)/like"
            
        case let .feedLike(feedId):
            return "/api/feeds/\(feedId)/like"
            
        case .getFeedLike:
            return "/api/my-diary"
            
        case .getProductLike:
            return "/api/products/like"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .productLike, .feedLike:
            return .post
            
        case .getFeedLike, .getProductLike:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getFeedLike(query), let .getProductLike(query):
            return .requestParameters(parameters: query.asQueryItems(),
                                      encoding: URLEncoding.queryString)
            
        case .productLike, .feedLike:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getFeedLike, .getProductLike,
                .productLike, .feedLike:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value,
                    Header.authorization.key: Header.authorization.value]
        }
    }
}
