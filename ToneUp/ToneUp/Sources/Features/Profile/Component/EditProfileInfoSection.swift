//
//  EditProfileInfoSection.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI
import ComposableArchitecture

struct EditProfileInfoSection: View {
    
    @Bindable var store: StoreOf<Profile>
    @State private var name: String = "김승용"
    @State private var introduction: String = "안녕하세요"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("프로필 정보")
                .font(.headline)
                .padding(.bottom, 4)
            
            ProfileRowItem(store: store,
                           value: $store.nickname,
                           title: "프로필 이름",
                           placeholder: "성명을 입력해주세요")
            
            ProfileRowItem(store: store,
                           value: $store.bio,
                           title: "소개",
                           placeholder: "나를 소개하세요")
            
            CommonButton(icon: nil,
                         backgroundColor: .white,
                         text: .withdraw,
                         textColor: .black,
                         symbolColor: nil,
                         cornerRadius: 8,
                         font: .regular14,
                         borderColor: .profileBorder,
                         height: 28,
                         hasBorder: true,
                         hasInternalPadding: false) {
                store.send(.editTextFieldButtonTapped)
            }
                         .padding(.top, 4)
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
    
}
