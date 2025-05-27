//
//  APIError.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct ServerErrorResponse: Decodable, Error {
    let success: Bool?
    let code: Int
    let errorCode: String
    let message: String
}

enum APIError: Error, LocalizedError {
    case server(errorCode: String, defaultMessage: String)

    var errorDescription: String? {
        return APIError.customMessages[errorCode] ?? defaultMessage
    }

    private var errorCode: String {
        switch self {
        case .server(let code, _): return code
        }
    }

    private var defaultMessage: String {
        switch self {
        case .server(_, let message): return message
        }
    }

    private static let customMessages: [String: String] = [
        "MISSING_REQUIRED_FIELDS": "필수 입력값이 빠졌습니다! 다시 확인해주세요."
    ]
}
