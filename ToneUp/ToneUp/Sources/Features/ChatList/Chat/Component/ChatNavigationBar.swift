//
//  ChatNavigationBar.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import SwiftUI

struct ChatNavigationBar: View {
    
    let name: String

    var body: some View {
        ZStack {
            HStack {
                CommonButton(
                    icon: Image(systemName: "chevron.left"),
                    backgroundColor: .clear,
                    text: nil,
                    textColor: .black,
                    symbolColor: .black,
                    cornerRadius: 0,
                    font: nil,
                    minWidth: 44,
                    height: 44,
                    hasBorder: false,
                    hasInternalPadding: false
                ) {
                    
                }

                Spacer()

                Menu {
                    Button("신고하기",
                           role: .destructive) {
                        
                    }
                } label: {
                    CommonButton(
                        icon: Image(systemName: "ellipsis"),
                        backgroundColor: .clear,
                        text: nil,
                        textColor: .black,
                        symbolColor: .black,
                        cornerRadius: 0,
                        font: nil,
                        minWidth: 44,
                        height: 44,
                        hasBorder: false,
                        hasInternalPadding: false
                    ) {
                        
                    }
                    .rotationEffect(.degrees(90))
                }
            }

            CommonText(text: "\(name) 채팅",
                       font: .regular20)
        }
        .background(.chatBackground)
    }
    
}

#Preview {
    ChatNavigationBar(name: "안녕")
}
