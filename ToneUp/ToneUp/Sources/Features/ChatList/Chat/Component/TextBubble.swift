//
//  TextBubble.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import SwiftUI

struct TextBubble: View {
    
    let text: String
    let isMe: Bool
    
    var body: some View {
        Text(text)
            .padding(12)
            .background(isMe ? .white : Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
}

#Preview {
    TextBubble(text: "aa",
               isMe: false)
}
