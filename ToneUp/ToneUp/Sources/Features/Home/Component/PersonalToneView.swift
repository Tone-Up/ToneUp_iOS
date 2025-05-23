//
//  PersonalToneView.swift
//  ToneUp
//
//  Created by 전준영 on 5/18/25.
//

import SwiftUI

struct PersonalToneView: View {
    
    let tone: UserTone
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 12) {
            HStack {
                Image.color4
                
                CommonText(text: "준영님의 톤",
                           font: .notoRegular18)
            }
            .padding(.horizontal)
            
            HStack {
                CommonText(text: tone.rawValue,
                           font: .notoSemiBold40,
                           color: .black)
            }
            .padding(.horizontal)
            
            HStack {
                Image.color4
                
                CommonText(text: tone.rawValue,
                           font: .notoRegular18,
                           color: .black)
                
                Spacer()
                
                CommonButton(icon: nil,
                             backgroundColor: .retryButton,
                             text: .retryTone,
                             textColor: .black,
                             symbolColor: nil,
                             cornerRadius: 16,
                             font: .notoRegular14,
                             minWidth: 120,
                             height: 32,
                             hasInternalPadding: false) {
                    
                }
            }
            .padding(.horizontal)
        }
               .padding(.vertical, 20)
               .background(.white)
    }
    
}

#Preview {
    PersonalToneView(tone: .autumn)
}
