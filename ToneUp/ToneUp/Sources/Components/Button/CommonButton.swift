//
//  CommonButton.swift
//  ToneUp
//
//  Created by 전준영 on 5/16/25.
//

import SwiftUI

struct CommonButton: View {
    
    let icon: Image? //글자만 있는 버튼도 사용할 수 있도록
    let backgroundColor: Color //배경색
    let disabledBackgroundColor: Color? = .gray// disabled일때 배경색상
    let text: ButtonTitle //글자
    let textColor: Color //글자색상
    let symbolColor: Color? //로고 색상
    let cornerRadius: CGFloat //모서리
    var isEnabled: Bool = true
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            HStack {
                if let icon = icon {
                    icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(symbolColor ?? .primary)
                }
                
                Text(text.rawValue)
                    .font(.headline)
                    .foregroundStyle(textColor.opacity(0.85))
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isEnabled ? backgroundColor : (disabledBackgroundColor ?? backgroundColor))
            .cornerRadius(cornerRadius)
        }
        .disabled(!isEnabled)
    }
    
}

#Preview {
    CommonButton(icon: nil,
                 backgroundColor: .red,
                 text: .goLogin,
                 textColor: .green,
                 symbolColor: .blue,
                 cornerRadius: 20,
                 action: {
        
    })
}
