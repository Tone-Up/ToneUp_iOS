//
//  StylePostView.swift
//  ToneUp
//
//  Created by 전준영 on 5/25/25.
//

import SwiftUI
import ComposableArchitecture

enum PostType: String, CaseIterable, Identifiable, Equatable {
    case feed = "Feed"
    case myStyle = "MyStyle"
    
    var id: Self { self }
}

struct StylePostView: View {
    
    @Bindable var store: StoreOf<Post>
    
    var body: some View {
        VStack(spacing: 16) {
            Picker("유형", selection: $store.postType) {
                ForEach(PostType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            ImagePickerSection(images: $store.images)
            
            if store.postType != .feed {
                TitleInputView(title: $store.title)
            }
            
            DescriptionInputView(description: $store.description)
            
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
                store.send(.isWriteButtonTapped)
            }
                         .padding(.horizontal)
                         .padding(.bottom, 16)
        }
        .padding(.top, 8)
        .background(.mainBackground)
        .navigationTitle(store.postType == .feed ? "스타일 공유" : "내 스타일 기록")
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
    StylePostView(
        store: Store(initialState: Post.State()) {
            Post()
        }
    )
}
