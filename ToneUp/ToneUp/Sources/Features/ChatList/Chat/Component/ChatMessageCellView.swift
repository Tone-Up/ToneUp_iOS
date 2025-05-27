//
//  ChatMessageCellView.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import SwiftUI

struct ChatMessageCellView: View {
    
    let message: ChatMessage
    
    var body: some View {
        VStack(alignment: message.sender == .me ? .trailing : .leading, spacing: 4) {
            if message.sender == .other && message.showNameAndProfile {
                HStack(alignment: .top, spacing: 8) {
                    message.profileImage?
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(message.name ?? "")
                            .font(.caption)
                        
                        if let text = message.text {
                            HStack(alignment: .bottom, spacing: 4) {
                                TextBubble(text: text, isMe: false)
                                Text(message.time)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        } else if let images = message.images {
                            VStack(alignment: .leading, spacing: 2) {
                                ImageGridMessageView(images: images)
                                Text(message.time)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                if let text = message.text {
                    HStack(alignment: .bottom, spacing: 4) {
                        if message.sender == .me {
                            Text(message.time)
                                .font(.caption2)
                                .foregroundColor(.gray)
                            TextBubble(text: text, isMe: true)
                        } else {
                            TextBubble(text: text, isMe: false)
                            Text(message.time)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: message.sender == .me ? .trailing : .leading)
                } else if let images = message.images {
                    VStack(alignment: message.sender == .me ? .trailing : .leading, spacing: 2) {
                        ImageGridMessageView(images: images)
                        Text(message.time)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: message.sender == .me ? .trailing : .leading)
                }
            }
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    ChatMessageCellView(message: ChatMessage(
        sender: .other,
        name: "상대방",
        profileImage: Image(systemName: "person.circle"),
        text: "안녕하세요!",
        images: nil,
        time: "12:34",
        showNameAndProfile: true
    ))
}
