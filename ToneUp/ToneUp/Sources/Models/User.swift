//
//  User.swift
//  ToneUp
//
//  Created by 전준영 on 5/17/25.
//

import Foundation

struct User {
    let id: Int
    let nickname: String
    let accessToken: String
    let refreshToken: String
    let isPersonal: Bool
    let signedUp: Bool
}

extension User {
    init(from dto: UserDTO) {
        self.id = dto.userId ?? -1
        self.nickname = dto.nickname ?? "Unknown"
        self.accessToken = dto.accessToken ?? ""
        self.refreshToken = dto.refreshToken ?? ""
        self.isPersonal = dto.personal ?? false
        self.signedUp = dto.signedUp ?? false
    }
}
