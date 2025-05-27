//
//  UserDTO.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct UserDTO: Decodable {
    
    let provider: String
    let isPersonal: Bool
    let isSignedUp: Bool
    let nickname: String?
    let userId: Int?
    let accessToken: String?
    let refreshToken: String?
    
}
