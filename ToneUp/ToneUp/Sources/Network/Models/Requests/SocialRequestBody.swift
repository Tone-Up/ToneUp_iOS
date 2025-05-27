//
//  SocialRequestBody.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct SocialRequestBody: Encodable {
    
    let provider: String?
    let token: String?
    
    init(provider: String? = nil,
         token: String? = nil) {
        self.provider = provider
        self.token = token
    }
    
}
