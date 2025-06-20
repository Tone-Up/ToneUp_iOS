//
//  TokenRequestBody.swift
//  ToneUp
//
//  Created by 전준영 on 5/29/25.
//

import Foundation

struct TokenRequestBody: Encodable {
    
    let accessToken: String?
    let refreshToken: String?
    let fcmToken: String?
    
    init(accessToken: String?,
         refreshToken: String?,
         fcmToken: String?) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.fcmToken = fcmToken
    }
    
}
