//
//  ProfileContentView.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI

struct ProfileContentView: View {
    
    let isMine: Bool
    
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
                    HStack(alignment: .center,
                           spacing: 4) {
                        CommonText(text: "김승용",
                                   font: .notoBold20)
                        
                        CommonText(text: "#봄웜",
                                   font: .notoBold20)
                        
                        if !isMine {
                            CommonButton(icon: nil,
                                         backgroundColor: .white,
                                         text: .follow,
                                         textColor: .black,
                                         symbolColor: nil,
                                         cornerRadius: 8,
                                         font: .regular12,
                                         borderColor: .profileBorder,
                                         minWidth: 52,
                                         height: 28,
                                         hasBorder: true,
                                         hasInternalPadding: false) {
                                
                            }
                                         .padding(.leading, 8)
                        }
                    }
                    
                    HStack(spacing: 4) {
                        CommonText(text: "팔로워",
                                   font: .notoRegular15)
                        
                        CommonText(text: "10",
                                   font: .notoBold15)
                        
                        CommonText(text: "|",
                                   font: .notoRegular15)
                        
                        CommonText(text: "팔로잉",
                                   font: .notoRegular15)
                        
                        CommonText(text: "13",
                                   font: .notoBold15)
                    }
                }
            }
            
            VStack(alignment: .leading,
                   spacing: 8) {
                CommonText(text: "fdjskfjei@naver.com",
                           font: .notoSemiBold12)
                
                CommonText(text: "안녕하세요",
                           font: .regular14)
            }
            
            if isMine {
                CommonButton(icon: nil,
                             backgroundColor: .white,
                             text: .manageProfile,
                             textColor: .black,
                             symbolColor: nil,
                             cornerRadius: 8,
                             font: .regular14,
                             borderColor: .profileBorder,
                             height: 28,
                             hasBorder: true,
                             hasInternalPadding: false) {
                    
                }
                             .padding(.top, 4)
            } else {
                CommonButton(icon: nil,
                             backgroundColor: .white,
                             text: .profielChatGo,
                             textColor: .black,
                             symbolColor: nil,
                             cornerRadius: 8,
                             font: .regular14,
                             borderColor: .profileBorder,
                             height: 28,
                             hasBorder: true,
                             hasInternalPadding: false) {
                    
                }
                             .padding(.top, 4)
            }
        }
               .padding()
               .background(.white)
    }
    
}

#Preview {
    ProfileContentView(isMine: false)
}
