//
//  OnboardingView.swift
//  ToneUp
//
//  Created by 전준영 on 5/16/25.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
    
    @Bindable var store: StoreOf<Onboarding>
    
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
                store.send(.loginButtonTapped)
            }
                         .padding(20)
        }
        .sheet(isPresented: $store.isLoginSheetPresented) {
            LoginSheetView { selectedOption in
                store.send(.loginOptionSelected(selectedOption))
            }
            .presentationDetents([.fraction(0.4)])
        }
    }
    
}

#Preview {
    OnboardingView(
        store: Store(initialState: Onboarding.State()) {
            Onboarding()
        }
    )
}
