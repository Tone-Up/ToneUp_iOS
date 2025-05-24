//
//  PostDetailView.swift
//  ToneUp
//
//  Created by 전준영 on 5/24/25.
//

import SwiftUI

struct PostDetailView: View {
    
    let isMine: Bool
    let isFeed: Bool
    let imageCount: Int
    let currentIndex: Int
    let nickname: String
    let tag: String
    let content: String
    let dateString: String
    let likeCount: Int
    
    @State private var selectedImageIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Image.color4
                        .resizable()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                        .alignmentGuide(.firstTextBaseline) { d in
                            d[VerticalAlignment.center]
                        }
                    
                    CommonText(text: "\(nickname) #\(tag)", font: .notoBold16)
                    
                    Spacer()
                    
                    if !isMine && isFeed {
                        CommonButton(icon: nil,
                                     backgroundColor: .white,
                                     text: .follow,
                                     textColor: .black,
                                     symbolColor: nil,
                                     cornerRadius: 8,
                                     font: .regular12,
                                     borderColor: .gray,
                                     minWidth: 52,
                                     height: 28,
                                     hasBorder: true,
                                     hasInternalPadding: false) {
                            
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                ZStack(alignment: .bottomTrailing) {
                    TabView(selection: $selectedImageIndex) {
                        ForEach(0..<imageCount, id: \.self) { index in
                            Image.onboardingImage
                                .resizable()
                                .scaledToFill()
                                .frame(height: 400)
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 400)
                    
                    Text("\(selectedImageIndex + 1)/\(imageCount)")
                        .font(.caption2)
                        .padding(6)
                        .background(Color.white.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(8)
                }
                
                VStack(alignment: .leading,
                       spacing: 8) {
                    if isFeed {
                        HStack(spacing: 4) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            
                            Text("\(likeCount)")
                                .font(.footnote)
                        }
                    }
                    
                    (
                        Text("\(nickname) #\(tag) ")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        +
                        Text(content)
                            .font(.subheadline)
                    )
                    
                    Text(dateString)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                       .padding()
                       .frame(maxWidth: .infinity,
                              alignment: .leading)
                
                Spacer()
            }
            .navigationTitle(isFeed ? "게시물" : "제목")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    //    PostDetailView(isMine: false,
    //                   isFeed: true,
    //                   imageCount: 4,
    //                   currentIndex: 1,
    //                   nickname: "전준영",
    //                   tag: "가을",
    //                   content: "요즘 날씨에 찰떡인 코디!!",
    //                   dateString: "2025년 05월 09일",
    //                   likeCount: 5)
    
    PostDetailView(isMine: true,
                   isFeed: false,
                   imageCount: 2,
                   currentIndex: 1,
                   nickname: "전준영",
                   tag: "가을",
                   content: "가을 느낌 가득한 스타일링이에요.",
                   dateString: "2025년 05월 03일",
                   likeCount: 0)
}
