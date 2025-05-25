//
//  StylePostView.swift
//  ToneUp
//
//  Created by 전준영 on 5/25/25.
//

import SwiftUI

struct StylePostView: View {
    
    let isSharingFeed: Bool
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var images: [UIImage] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                ImagePickerSection(images: $images)
                
                if isSharingFeed {
                    TitleInputView(title: $title)
                }
                
                DescriptionInputView(description: $description)
                
                Spacer()
                
                CommonButton(icon: nil,
                             backgroundColor: .white,
                             text: .postComplete,
                             textColor: .black,
                             symbolColor: nil,
                             cornerRadius: 8,
                             font: .notoRegular14,
                             borderColor: .profileBorder,
                             height: 48,
                             hasBorder: true) {
                    
                }
                             .padding(.horizontal)
                             .padding(.bottom, 16)
            }
            .padding(.top, 8)
            .background(.mainBackground)
            .navigationTitle(isSharingFeed ? "스타일 공유" : "내 스타일 기록")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    StylePostView(isSharingFeed: true)
}
