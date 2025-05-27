//
//  ChatMessageListView.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import SwiftUI

struct ChatMessageListView: View {
    
    let messages: [ChatMessage]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(messages) { message in
                    ChatMessageCellView(message: message)
                }
            }
            .padding()
        }
    }
    
}

#Preview {
    ChatMessageListView(messages: [
        ChatMessage(
            sender: .other,
            name: "상대방",
            profileImage: Image(systemName: "person.circle"),
            text: "안녕하세요!",
            images: nil,
            time: "12:34",
            showNameAndProfile: true
        ),
        ChatMessage(
            sender: .me,
            name: nil,
            profileImage: nil,
            text: "안녕하세요! 반가워요.",
            images: nil,
            time: "12:35",
            showNameAndProfile: false
        ),
        ChatMessage(
            sender: .other,
            name: "ㅇ",
            profileImage: Image(systemName: "person.circle"),
            text: "오늘 날씨 정말 좋네요 🌞",
            images: nil,
            time: "12:36",
            showNameAndProfile: false
        ),
        ChatMessage(
            sender: .other,
            name: nil,
            profileImage: nil,
            text: "오늘 날씨 정말 좋네요 🌞",
            images: nil,
            time: "12:36",
            showNameAndProfile: false
        ),
        ChatMessage(
            sender: .me,
            name: nil,
            profileImage: nil,
            text: nil,
            images: [UIImage(named: "color4") ?? UIImage()],
            time: "12:37",
            showNameAndProfile: false
        )
    ])
}
