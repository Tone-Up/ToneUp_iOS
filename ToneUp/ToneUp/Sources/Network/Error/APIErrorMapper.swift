//
//  APIErrorMapper.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation
import Moya

struct APIErrorMapper {
    
    static func map(_ error: Error) -> APIError {
        guard let moyaError = error as? MoyaError else {
            return .server(errorCode: "UNKNOWN",
                           defaultMessage: error.localizedDescription)
        }
        
        switch moyaError {
        case let .underlying(underlyingError, _):
            if let urlError = underlyingError as? URLError {
                return mapURLError(urlError)
            }
            
        case let .statusCode(response):
            if let decoded = try? JSONDecoder().decode(ServerErrorResponse.self,
                                                       from: response.data) {
                return .server(errorCode: decoded.errorCode,
                               defaultMessage: decoded.message)
            }
            
        default:
            break
        }
        
        return .server(errorCode: "UNKNOWN",
                       defaultMessage: "예상치 못한 오류가 발생했습니다.")
    }
    
    private static func mapURLError(_ error: URLError) -> APIError {
        switch error.code {
        case .notConnectedToInternet:
            return .server(errorCode: "NO_INTERNET",
                           defaultMessage: "인터넷 연결이 끊겼습니다.")
            
        case .timedOut:
            return .server(errorCode: "TIMEOUT",
                           defaultMessage: "요청 시간이 초과되었습니다.")
            
        case .cannotFindHost:
            return .server(errorCode: "HOST_NOT_FOUND",
                           defaultMessage: "서버를 찾을 수 없습니다.")
            
        default:
            return .server(errorCode: "NETWORK_FAIL",
                           defaultMessage: error.localizedDescription)
        }
    }
    
}
