//
//  ChatInputBar.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import SwiftUI

struct ChatInputBar: View {
    
    @Binding var text: String
    @Binding var selectedImages: [UIImage]
    let onSend: () -> Void
    let onImageSend: () -> Void
    
    @State private var textHeight: CGFloat = 40
    private let maxLineCount = 6
    private let lineHeight: CGFloat = 20
    
    var body: some View {
        VStack(spacing: 4) {
            if !selectedImages.isEmpty {
                ImagePreviewView(selectedImages: $selectedImages)
            }
            
            HStack(alignment: .bottom) {
                CommonButton(
                    icon: Image(systemName: "camera"),
                    backgroundColor: .clear,
                    text: nil,
                    textColor: .black,
                    symbolColor: .black,
                    cornerRadius: 0,
                    minWidth: 32,
                    height: 32,
                    hasBorder: false,
                    hasInternalPadding: false
                ) {
                    
                }
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .padding(8)
                        .frame(minHeight: 40,
                               maxHeight: min(CGFloat(maxLineCount) * lineHeight, textHeight))
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .onChange(of: text) { _ in
                            recalculateHeight()
                        }
                    
                    if text.isEmpty {
                        Text("메시지 입력")
                            .foregroundColor(.gray)
                            .padding(12)
                            .allowsHitTesting(false)
                    }
                }
                
                if selectedImages.count == 5 || !text.isEmpty {
                    CommonButton(
                        icon: Image(systemName: "paperplane.fill"),
                        backgroundColor: .clear,
                        text: nil,
                        textColor: .black,
                        symbolColor: .black,
                        cornerRadius: 0,
                        minWidth: 32,
                        height: 32,
                        hasBorder: false,
                        hasInternalPadding: false
                    ) {
                        if !text.isEmpty {
                            onSend()
                        } else {
                            onImageSend()
                        }
                    }
                } else {
                    CommonButton(
                        icon: Image(systemName: "photo"),
                        backgroundColor: .clear,
                        text: nil,
                        textColor: .black,
                        symbolColor: .black,
                        cornerRadius: 0,
                        minWidth: 32,
                        height: 32,
                        hasBorder: false,
                        hasInternalPadding: false
                    ) {
                        
                    }
                }
            }
            .padding(8)
            .background(.white)
        }
    }
    
    private func recalculateHeight() {
        let size = CGSize(width: UIScreen.main.bounds.width - 120, height: .infinity)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17)
        ]
        let boundingRect = text.boundingRect(
            with: size,
            options: .usesLineFragmentOrigin,
            attributes: attributes,
            context: nil
        )
        textHeight = boundingRect.height + 24
    }
    
}
