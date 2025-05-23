//
//  ProfileRowItem.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI

struct ProfileRowItem: View {
    
    let title: String
    let placeholder: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                TextField(placeholder, text: $value)
                    .font(.body)
                
                Spacer()
                
                CommonButton(icon: nil,
                             backgroundColor: .white,
                             text: .change,
                             textColor: .black,
                             symbolColor: nil,
                             cornerRadius: 8,
                             font: .regular14,
                             borderColor: .profileBorder,
                             minWidth: 56,
                             height: 28,
                             hasBorder: true,
                             hasInternalPadding: false) {
                    
                }
                             .padding(.bottom, 4)
            }
            
            Divider()
        }
    }
    
}
