//
//  ChatView.swift
//  ToneUp
//
//  Created by 전준영 on 5/26/25.
//

import SwiftUI
import ComposableArchitecture

struct ChatView: View {
    
    @Bindable var store: StoreOf<Chat>
    
    var body: some View {
        VStack(spacing: 0) {
            ChatNavigationBar(name: "정상철")
            
            ChatMessageListView(messages: store.messages)
            
            ChatInputBar(
                text: $store.currentInput,
                selectedImages: $store.selectedImages,
                onSend: { store.send(.sendTextMessage) },
                onImageSend: { store.send(.sendImageMessage) }
            )
        }
        .background(.chatBackground)
    }
    
}

#Preview {
    ChatView(
        store: Store(initialState: Chat.State()) {
            Chat()
        }
    )
}
