//
//  ImageGridMessageView.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import SwiftUI

struct ImageGridMessageView: View {
    
    let images: [UIImage]
    
    var body: some View {
        let width = UIScreen.main.bounds.width * 0.6
        
        switch images.count {
        case 1:
            Image(uiImage: images[0])
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width * 1.2)
                .clipped()
                .cornerRadius(12)
            
        case 2:
            HStack(spacing: 2) {
                ForEach(0..<2, id: \..self) { i in
                    Image(uiImage: images[i])
                        .resizable()
                        .scaledToFill()
                        .frame(width: width / 2 - 1, height: width * 0.7)
                        .clipped()
                        .cornerRadius(8)
                }
            }
            
        case 3:
            VStack(spacing: 2) {
                HStack(spacing: 2) {
                    ForEach(0..<2, id: \..self) { i in
                        Image(uiImage: images[i])
                            .resizable()
                            .scaledToFill()
                            .frame(width: width / 2 - 1, height: width * 0.4)
                            .clipped()
                            .cornerRadius(8)
                    }
                }
                Image(uiImage: images[2])
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width * 0.6)
                    .clipped()
                    .cornerRadius(8)
            }
            
        default:
            VStack(spacing: 2) {
                ForEach(images.chunked(into: 2), id: \..self) { row in
                    HStack(spacing: 2) {
                        ForEach(row, id: \..self) { img in
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: width / 2 - 1, height: width * 0.5)
                                .clipped()
                                .cornerRadius(8)
                        }
                    }
                }
            }
            
        }
    }
    
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

#Preview {
    ImageGridMessageView(images: [
        UIImage(named: "color4") ?? UIImage(),
        UIImage(named: "googleLogo") ?? UIImage(),
        UIImage(named: "naverLogo") ?? UIImage(),
        UIImage(named: "naverLogo") ?? UIImage(),
        UIImage(named: "naverLogo") ?? UIImage()
    ])
}
