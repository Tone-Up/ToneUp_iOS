//
//  EditProfileView.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI
import ComposableArchitecture

struct EditProfileView: View {
    
    @Bindable var store: StoreOf<Profile>
    
    var body: some View {
        VStack(spacing: 8) {
            EditProfileContentView(store: store)
            
            Divider()
            
            EditProfileInfoSection()
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .customNavigationBar(
            title: AppText.NavigationText.setProfile.rawValue,
            trailing: .none
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(color: .black)
            }
        }
    }
    
}
