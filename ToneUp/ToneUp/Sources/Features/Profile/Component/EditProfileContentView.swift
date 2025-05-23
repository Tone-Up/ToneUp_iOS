//
//  EditProfileContentView.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI

struct EditProfileContentView: View {
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 12) {
            HStack(alignment: .center,
                   spacing: 12) {
                Image.color4
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                VStack(alignment: .leading,
                       spacing: 4) {
                    CommonText(text: "김승용", font: .notoBold20)
                    
                    HStack(spacing: 4) {
                        CommonButton(
                            icon: nil,
                            backgroundColor: .white,
                            text: .editImage,
                            textColor: .black,
                            symbolColor: nil,
                            cornerRadius: 6,
                            font: .regular12,
                            borderColor: .profileBorder,
                            minWidth: 72,
                            height: 24,
                            hasBorder: true,
                            hasInternalPadding: false
                        ) {
                            
                        }
                        
                        CommonButton(
                            icon: nil,
                            backgroundColor: .white,
                            text: .delete,
                            textColor: .black,
                            symbolColor: nil,
                            cornerRadius: 6,
                            font: .regular12,
                            borderColor: .profileBorder,
                            minWidth: 48,
                            height: 24,
                            hasBorder: true,
                            hasInternalPadding: false
                        ) {
                            
                        }
                    }
                }
                
                Spacer()
            }
            
        }
               .padding()
               .background(.white)
    }
    
}

#Preview {
    EditProfileContentView()
}

