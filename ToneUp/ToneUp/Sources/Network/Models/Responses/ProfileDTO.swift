//
//  ProfileDTO.swift
//  ToneUp
//
//  Created by 전준영 on 6/30/25.
//

import Foundation

struct ProfileDTO: Decodable, Equatable {
    let userId: Int
    let nickname: String
    let profileImageUrl: String
    let bio: String
}
