//
//  MyStyleAPI.swift
//  ToneUp
//
//  Created by 전준영 on 6/1/25.
//

import Foundation
import Moya

enum MyStyleAPI {
    case getMyStyle(query: QueryParameters)
    case postMyStyle(body: PostRequestBody)
    case deleteMyStyle(diaryId: Int)
}

extension MyStyleAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getMyStyle:
            return "/api/my-diary"
            
        case .postMyStyle:
            return "/api/my-diary"
            
        case let .deleteMyStyle(diaryId):
            return "/api/my-diary/\(diaryId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyStyle:
            return .get
            
        case .postMyStyle:
            return .post
            
        case .deleteMyStyle:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .getMyStyle(query):
            return .requestParameters(parameters: query.asQueryItems(),
                                      encoding: URLEncoding.queryString)
            
        case let .postMyStyle(body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
            
        case .deleteMyStyle:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getMyStyle, .postMyStyle,
                .deleteMyStyle:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value,
                    Header.authorization.key: Header.authorization.value]
        }
    }
}
