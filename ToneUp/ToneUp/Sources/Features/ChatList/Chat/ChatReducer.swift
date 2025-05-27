//
//  ChatReducer.swift
//  ToneUp
//
//  Created by 전준영 on 5/26/25.
//

import SwiftUI
import ComposableArchitecture

struct Chat: Reducer {
    
    @ObservableState
    struct State {
        var messages: [ChatMessage] = []
        var currentInput: String = ""
        var selectedImages: [UIImage] = []
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case sendTextMessage
        case sendImageMessage
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .sendTextMessage:
                guard !state.currentInput.isEmpty else { return .none }
                state.messages.append(
                    ChatMessage(
                        sender: .me,
                        name: nil,
                        profileImage: nil,
                        text: state.currentInput,
                        images: nil,
                        time: currentTime(),
                        showNameAndProfile: false
                    )
                )
                state.currentInput = ""
                return .none
                
            case .sendImageMessage:
                guard !state.selectedImages.isEmpty else { return .none }
                state.messages.append(
                    ChatMessage(
                        sender: .me,
                        name: nil,
                        profileImage: nil,
                        text: nil,
                        images: state.selectedImages,
                        time: currentTime(),
                        showNameAndProfile: false
                    )
                )
                state.selectedImages = []
                return .none
                
            case .binding:
                return .none
            }
        }
    }
    
    private func currentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
}

struct ChatMessage: Identifiable, Equatable {
    enum SenderType {
        case me, other
    }
    
    let id = UUID()
    let sender: SenderType
    let name: String?
    let profileImage: Image?
    let text: String?
    let images: [UIImage]?
    let time: String
    let showNameAndProfile: Bool
}
