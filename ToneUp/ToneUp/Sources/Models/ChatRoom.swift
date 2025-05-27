//
//  ChatRoom.swift
//  ToneUp
//
//  Created by 전준영 on 5/26/25.
//

import Foundation

struct ChatRoom: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
    let unreadCount: Int
    let lastDate: String
}
