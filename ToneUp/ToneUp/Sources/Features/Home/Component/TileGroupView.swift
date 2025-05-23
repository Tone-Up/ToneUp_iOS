//
//  TileGroupView.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI

struct TileGroupView: View {
    
    let images: [Image]
    let isLeftBig: Bool
    let screenWidth: CGFloat
    
    var body: some View {
        let smallWidth = screenWidth / 3
        let largeWidth = screenWidth - smallWidth
        
        HStack(spacing: 0) {
            if isLeftBig {
                VStack(spacing: 0){
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            FeedImageTile(image: images[safe: 0] ?? .onboardingImage,
                                          width: largeWidth,
                                          height: 400)
                        }
                        
                        VStack(spacing: 0) {
                            FeedImageTile(image: images[safe: 1] ?? .onboardingImage,
                                          width: smallWidth,
                                          height: 200)
                            
                            FeedImageTile(image: images[safe: 2] ?? .onboardingImage,
                                          width: smallWidth,
                                          height: 200)
                        }
                    }
                    
                    HStack(spacing: 0) {
                        FeedImageTile(image: images[safe: 3] ?? .onboardingImage,
                                      width: smallWidth,
                                      height: 200)
                        
                        FeedImageTile(image: images[safe: 4] ?? .onboardingImage,
                                      width: smallWidth,
                                      height: 200)
                        
                        FeedImageTile(image: images[safe: 5] ?? .onboardingImage,
                                      width: smallWidth,
                                      height: 200)
                    }
                }
            } else {
                VStack(spacing: 0){
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            FeedImageTile(image: images[safe: 0] ?? .onboardingImage,
                                          width: smallWidth,
                                          height: 200)
                            
                            FeedImageTile(image: images[safe: 1] ?? .onboardingImage,
                                          width: smallWidth,
                                          height: 200)
                        }
                        
                        VStack(spacing: 0) {
                            FeedImageTile(image: images[safe: 2] ?? .onboardingImage,
                                          width: largeWidth,
                                          height: 400)
                        }
                    }
                    
                    HStack(spacing: 0) {
                        FeedImageTile(image: images[safe: 3] ?? .onboardingImage,
                                      width: smallWidth,
                                      height: 200)
                        
                        FeedImageTile(image: images[safe: 4] ?? .onboardingImage,
                                      width: smallWidth,
                                      height: 200)
                        
                        FeedImageTile(image: images[safe: 5] ?? .onboardingImage,
                                      width: smallWidth,
                                      height: 200)
                    }
                }
            }
        }
    }
}
