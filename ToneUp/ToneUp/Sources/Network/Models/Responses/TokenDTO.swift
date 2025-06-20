//
//  TokenDTO.swift
//  ToneUp
//
//  Created by 전준영 on 5/29/25.
//

import Foundation

struct TokenDTO: Decodable {
    
    let accessToken: String
    let refreshToken: String
    
}
