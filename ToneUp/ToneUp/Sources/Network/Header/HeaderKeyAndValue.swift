//
//  HeaderKeyAndValue.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

enum Header {
    
    case contentTypeJson
    case contentTypeMulti
    case authorization
    case image
    
    var key: String {
        switch self {
        case .contentTypeJson,
                .contentTypeMulti:
            return "Content-Type"
            
        case .authorization:
            return "Authorization"
            
        case .image:
            return "Content-Type"
        }
    }
    
    var value: String {
        switch self {
        case .contentTypeJson:
            return "application/json"
            
        case .contentTypeMulti:
            return "multipart/form-data"
            
        case .authorization:
            guard let token = KeychainManager.load(forKey: .accessToken) else { return "실패" }
            return "Bearer \(token)"
            
        case .image:
            return "image/png"
        }
    }
    
}
