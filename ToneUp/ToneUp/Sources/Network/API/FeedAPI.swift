//
//  FeedAPI.swift
//  ToneUp
//
//  Created by 전준영 on 6/1/25.
//

import Foundation
import Moya

enum FeedAPI {
    case getRecentFeed(query: QueryParameters)
    case getRankFeed(query: QueryParameters)
    case getDetailFeed(feedId: Int)
    case postFeed(body: PostRequestBody)
    case editPostFeed(feedId: Int,
                      body: PostRequestBody)
    case deletePostFeed(feedId: Int)
    case getReportFeed(feedId: Int,
                       body: ReportRequestBody)
}

extension FeedAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getRecentFeed:
            return "/api/feeds"
            
        case .getRankFeed:
            return "/api/rankingfeeds"
            
        case let .getDetailFeed(feedId):
            return "/api/feed/\(feedId)"
            
        case .postFeed:
            return "/api/feeds"
            
        case let .editPostFeed(feedId, _):
            return "/api/feeds/\(feedId)"
            
        case let .deletePostFeed(feedId):
            return "/api/feeds/\(feedId)"
            
        case let .getReportFeed(feedId, _):
            return "/api/v1/feeds/\(feedId)/report"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRecentFeed, .getRankFeed,
                .getDetailFeed:
            return .get
            
        case .postFeed, .getReportFeed:
            return .post
            
        case .editPostFeed:
            return .put
            
        case .deletePostFeed:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .getRecentFeed(query), let .getRankFeed(query):
            return .requestParameters(parameters: query.asQueryItems(),
                                      encoding: URLEncoding.queryString)
            
        case .getDetailFeed, .deletePostFeed:
            return .requestPlain
            
        case let .postFeed(body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
        case let .editPostFeed(_, body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
            
        case let .getReportFeed(_, body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getRecentFeed, .getRankFeed,
                .getDetailFeed, .deletePostFeed,
                .postFeed, .editPostFeed,
                .getReportFeed:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value,
                    Header.authorization.key: Header.authorization.value]
        }
    }
}
