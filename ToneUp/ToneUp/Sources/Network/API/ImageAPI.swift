//
//  ImageAPI.swift
//  ToneUp
//
//  Created by 전준영 on 7/9/25.
//

import Foundation
import Moya

enum ImageAPI {
    case postImageURL(body: ImageRequestBody)
    case putImageURL(url: String,
                     image: Data)
}

extension ImageAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .postImageURL:
            return URL(string: APIURL.baseURL)!
            
        case .putImageURL(let url, _):
            return URL(string: url)!
        }
    }
    
    var path: String {
        switch self {
        case .postImageURL:
            return "/api/uploads/presigned-urls"
            
        case .putImageURL:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postImageURL:
            return .post
            
        case .putImageURL:
            return .put
        }
    }
    
    var task: Task {
        switch self {
        case let .postImageURL(body):
            return .requestCustomJSONEncodable(body,
                                               encoder: JSONEncoder())
            
        case .putImageURL(_, let image):
            return .requestData(image)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .postImageURL:
            return [Header.contentTypeJson.key: Header.contentTypeJson.value,
                    Header.authorization.key: Header.authorization.value]
            
        case .putImageURL:
            return [Header.image.key: Header.image.value]
        }
    }
    
}
