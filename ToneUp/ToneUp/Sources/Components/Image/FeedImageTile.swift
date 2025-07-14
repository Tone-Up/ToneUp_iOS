//
//  FeedImageTile.swift
//  ToneUp
//
//  Created by 전준영 on 5/22/25.
//

import SwiftUI

struct FeedImageTile: View {
    
    let imageUrl: String?
    let placeholder: Image
    var isFeed: Bool = true
    var showHeart: Bool = true
    var width: CGFloat? = nil
    let height: CGFloat

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Group {
                if let s = imageUrl, let url = URL(string: s) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            placeholder
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: height)
                                .clipped()
                                .opacity(0.3)
                        case .success(let img):
                            img
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: height)
                                .clipped()
                        case .failure:
                            placeholder
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: height)
                                .clipped()
                        @unknown default:
                            placeholder
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: height)
                                .clipped()
                        }
                    }
                } else {
                    placeholder
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .clipped()
                }
            }

            if isFeed && showHeart {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .padding(6)
            }
        }
    }
}
