//
//  AnalyzeView.swift
//  ToneUp
//
//  Created by 전준영 on 6/25/25.
//

import SwiftUI
import ComposableArchitecture

struct AnalyzeView: View {
    
    @Bindable var store: StoreOf<Analyze>
    @State private var localSelectedImage: UIImage?
    
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
                if store.isLoading {
                    Color.black.opacity(0.3).ignoresSafeArea()
                    ProgressView("분석 중…")
                        .padding(20)
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                }
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
                        store.send(.cameraButtonTapped)
                    }
                                 .padding(.horizontal, 24)
                    
                    CustomPhotoPicker(
                        selectedImage: $localSelectedImage,
                        isPresentedError: $store.isGalleryErrorPresented,
                    ) {
                        CommonButton(icon: Image(systemName: "photo"),
                                     backgroundColor: .white,
                                     text: .gallery,
                                     textColor: .black,
                                     symbolColor: .black,
                                     cornerRadius: 30,
                                     font: .notoRegular18,
                                     height: 60,
                                     isEnabled: false,
                                     hasBorder: false,
                                     hasInternalPadding: true) { }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                    
                }
                .onChange(of: localSelectedImage) { newImage in
                    guard let img = newImage else { return }
                    store.send(.galleryImagePicked(img)) 
                }
                .alert("사진을 불러올 수 없습니다",
                       isPresented: $store.isGalleryErrorPresented) {
                    Button("확인") { }
                }
                       .fullScreenCover(isPresented: $store.isCameraButtonTapped) {
                           CameraCaptureView(
                            onDismiss: {
                                store.send(.set(\.isCameraButtonTapped, false))
                            },
                            onFaceFound: { image in
                                // TODO: store.send(.cameraCaptured(image))
                            }
                           )
                       }
            }
        }
    }
    
}

#Preview {
    AnalyzeView(
        store: Store(initialState: Analyze.State()) {
            Analyze()
        }
    )
}
