//
//  ServerResponse.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct ServerResponse<T: Decodable>: Decodable {
    let success: Bool
    let code: Int
    let errorCode: String?
    let message: String?
    let data: T?
}

func handleResponse<T: Decodable>(_ response: ServerResponse<T>) async throws -> T {
    guard response.success, let data = response.data else {
        throw APIError.server(
            errorCode: response.errorCode ?? "UNKNOWN",
            defaultMessage: response.message ?? "예상치 못한 오류가 발생했습니다."
        )
    }
    
    return data
}
