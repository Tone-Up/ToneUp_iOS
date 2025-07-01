//
//  StylePostView.swift
//  ToneUp
//
//  Created by 전준영 on 5/25/25.
//

import SwiftUI

struct StylePostView: View {
    
    private enum PostType: String, CaseIterable, Identifiable {
        case feed = "Feed"
        case myStyle = "MyStyle"
        
        var id: Self { self }
    }
    
    @State private var selectedType: PostType = .feed
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var images: [UIImage] = []
    
    var body: some View {
        VStack(spacing: 16) {
            
            Picker("유형", selection: $selectedType) {
                ForEach(PostType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            ImagePickerSection(images: $images)
            
            if selectedType == .feed {
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
        .navigationTitle(selectedType == .feed ? "스타일 공유" : "내 스타일 기록")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(color: .black)
            }
        }
    }
    
}

#Preview {
    StylePostView()
}
