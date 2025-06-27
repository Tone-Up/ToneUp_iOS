//
//  AnalyzeView.swift
//  ToneUp
//
//  Created by 전준영 on 6/25/25.
//

import SwiftUI

struct AnalyzeView: View {
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(.analyzeBackground)
                    .ignoresSafeArea()
                
                DecorativeCircle(
                    color: .circle1,
                    widthRatio: 0.9,
                    heightRatio: 0.9,
                    xRatio: 1.0,
                    yRatio: 0.0,
                    xOffset: 0,
                    yOffset: 20
                )
                
                DecorativeCircle(
                    color: .circle2,
                    widthRatio: 1.7,
                    heightRatio: 1.7,
                    xRatio: 1.0,
                    yRatio: 1.0,
                    xOffset: 0,
                    yOffset: -100
                )
                
                DecorativeCircle(
                    color: .circle3,
                    widthRatio: 0.9,
                    heightRatio: 0.9,
                    xRatio: 0,
                    yRatio: 1.0,
                    xOffset: 20,
                    yOffset: -100
                )
                
                VStack(spacing: 20) {
                    
                    VStack(spacing: 20) {
                        CommonText(text: AppText.AnalyzeView.title.rawValue,
                                   font: .notoBold32,
                                   color: .black)
                        .padding()
                        
                        CommonText(text: AppText.AnalyzeView.subTitle.rawValue,
                                   font: .notoRegular15,
                                   color: .black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(12)
                        
                        Image.person
                            .resizable()
                            .aspectRatio(0.9, contentMode: .fit)
                            .clipped()
                    }
                    .padding(.top, 32)
                    
                    Spacer()
                    
                    CommonButton(icon: Image(systemName: "camera.fill"),
                                 backgroundColor: .white,
                                 text: .camera,
                                 textColor: .black,
                                 symbolColor: .black,
                                 cornerRadius: 30,
                                 font: .notoRegular18,
                                 height: 60,
                                 hasBorder: false) {
                        print("true")
                    }
                                 .padding(.horizontal, 24)
                    
                    CommonButton(icon: Image(systemName: "photo"),
                                 backgroundColor: .white,
                                 text: .gallery,
                                 textColor: .black,
                                 symbolColor: .black,
                                 cornerRadius: 30,
                                 font: .notoRegular18,
                                 height: 60,
                                 hasBorder: false,
                                 hasInternalPadding: true) {
                        print("true")
                    }
                                 .padding(.horizontal, 24)
                                 .padding(.bottom, 20)
                }
            }
            
        }
    }
    
}

#Preview {
    AnalyzeView()
}
