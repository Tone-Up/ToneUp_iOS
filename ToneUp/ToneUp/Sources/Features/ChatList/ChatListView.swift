//
//  ChatListView.swift
//  ToneUp
//
//  Created by 전준영 on 5/26/25.
//

import SwiftUI

struct ChatListView: View {
    
    @State private var chatRooms: [ChatRoom] = [
        ChatRoom(name: "김승용", lastMessage: "코디 좋네요!", unreadCount: 2, lastDate: "어제"),
        ChatRoom(name: "지원", lastMessage: "피드백 감사드려요~", unreadCount: 0, lastDate: "어제"),
        ChatRoom(name: "유미", lastMessage: "느낌 너무 좋은데요??", unreadCount: 0, lastDate: "3일전"),
        ChatRoom(name: "상철", lastMessage: "코디 너무 제 스타일이에요!!", unreadCount: 0, lastDate: "3일전")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chatRooms) { room in
                    ChatCell(room: room)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                withAnimation {
                                    chatRooms.removeAll { $0.id == room.id }
                                }
                            } label: {
                                Text("나가기")
                            }
                            .tint(.red)
                        }
                }
            }
            .listStyle(.plain)
            .customNavigationBar(
                title: AppText.NavigationText.chat.rawValue
            )
        }
    }
    
}

#Preview {
    ChatListView()
}
