//
//  LoginSheetView.swift
//  ToneUp
//
//  Created by 전준영 on 5/17/25.
//

import SwiftUI

struct LoginSheetView: View {
    let onSelect: (LoginOption) -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            CommonButton(
                icon: Image.googleLogoImage,
                backgroundColor: .white,
                text: .googleLogin,
                textColor: .black,
                symbolColor: nil,
                cornerRadius: 12,
                hasBorder: true
            ) {
                
            }
            
            CommonButton(
                icon: Image(systemName: "message.fill"),
                backgroundColor: .yellow,
                text: .kakaoLogin,
                textColor: .black,
                symbolColor: .black,
                cornerRadius: 12
            ) {
                
            }
            
            CommonButton(
                icon: Image.naverLogoImage,
                backgroundColor: .naver,
                text: .naverLogin,
                textColor: .white,
                symbolColor: .white,
                cornerRadius: 12
            ) {
                
            }
        }
        .padding()
    }
}
