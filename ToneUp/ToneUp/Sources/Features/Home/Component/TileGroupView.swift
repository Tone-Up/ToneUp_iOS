//
//  TileGroupView.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI

struct TileGroupView: View {
    let imageUrls: [String]
    let isLeftBig: Bool
    let screenWidth: CGFloat

    var body: some View {
        let smallWidth = screenWidth / 3
        let largeWidth = screenWidth - smallWidth

        HStack(spacing: 0) {
            if isLeftBig {
                VStack(spacing: 0) {
                    // 상단: 큰 이미지 + 두 개 작은 이미지
                    HStack(spacing: 0) {
                        FeedImageTile(
                            imageUrl: imageUrls[safe: 0],
                            placeholder: .onboardingImage,
                            width: largeWidth, height: 400
                        )
                        VStack(spacing: 0) {
                            FeedImageTile(
                                imageUrl: imageUrls[safe: 1],
                                placeholder: .onboardingImage,
                                width: smallWidth, height: 200
                            )
                            FeedImageTile(
                                imageUrl: imageUrls[safe: 2],
                                placeholder: .onboardingImage,
                                width: smallWidth, height: 200
                            )
                        }
                    }
                    // 하단: 세 개 작은 이미지
                    HStack(spacing: 0) {
                        ForEach(3..<6) { idx in
                            FeedImageTile(
                                imageUrl: imageUrls[safe: idx],
                                placeholder: .onboardingImage,
                                width: smallWidth, height: 200
                            )
                        }
                    }
                }
            } else {
                VStack(spacing: 0) {
                    // 상단: 두 개 작은 이미지 + 큰 이미지
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            FeedImageTile(
                                imageUrl: imageUrls[safe: 0],
                                placeholder: .onboardingImage,
                                width: smallWidth, height: 200
                            )
                            FeedImageTile(
                                imageUrl: imageUrls[safe: 1],
                                placeholder: .onboardingImage,
                                width: smallWidth, height: 200
                            )
                        }
                        FeedImageTile(
                            imageUrl: imageUrls[safe: 2],
                            placeholder: .onboardingImage,
                            width: largeWidth, height: 400
                        )
                    }
                    // 하단: 세 개 작은 이미지
                    HStack(spacing: 0) {
                        ForEach(3..<6) { idx in
                            FeedImageTile(
                                imageUrl: imageUrls[safe: idx],
                                placeholder: .onboardingImage,
                                width: smallWidth, height: 200
                            )
                        }
                    }
                }
            }
        }
    }
}

// out-of-bounds 안전 처리
//fileprivate extension Array {
//    subscript(safe i: Int) -> Element? {
//        indices.contains(i) ? self[i] : nil
//    }
//}
