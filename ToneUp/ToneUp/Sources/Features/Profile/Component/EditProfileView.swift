//
//  EditProfileView.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI

struct EditProfileView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                EditProfileContentView()
                
                Divider()
                
                EditProfileInfoSection()
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .customNavigationBar(
                title: AppText.NavigationText.setProfile.rawValue,
                trailing: .none
            )
        }
    }
}

#Preview {
    EditProfileView()
}
