//
//  FeedImageTile.swift
//  ToneUp
//
//  Created by 전준영 on 5/22/25.
//

import SwiftUI

struct FeedImageTile: View {
    
    let image: Image
    var isFeed: Bool? = true
    var showHeart: Bool = true
    var width: CGFloat? = nil
    var height: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if isFeed ?? true {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
                
                
                if showHeart {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .padding(6)
                }
            } else {
                VStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .clipped()
                    
                    CommonText(text: "제목")
                }
            }
        }
        
    }
}
