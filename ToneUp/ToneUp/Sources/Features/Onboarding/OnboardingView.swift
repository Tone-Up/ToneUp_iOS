//
//  OnboardingView.swift
//  ToneUp
//
//  Created by 전준영 on 5/16/25.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        VStack() {
            Spacer()
            
            CommonText(text: AppText
                .Logo
                .title
                .rawValue,
                       font: .notoMedium60,
                       color: .black)
            
            CommonText(text: AppText
                .Onboarding
                .subTitle
                .rawValue,
                       font: .notoRegular18,
                       color: .black)
            
            Image.onboardingImage
            
            Spacer()
            
            CommonButton(icon: nil,
                         backgroundColor: .gray,
                         text: .goLogin,
                         textColor: .black,
                         symbolColor: nil,
                         cornerRadius: 24) {
                
            }
                         .padding(20)
        }
    }
    
}

#Preview {
    OnboardingView()
}
