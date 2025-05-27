//
//  ImagePreviewView.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import SwiftUI

struct ImagePreviewView: View {
    
    @Binding var selectedImages: [UIImage]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(selectedImages.indices, id: \..self) { index in
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: selectedImages[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(6)
                        
                        Button(action: {
                            selectedImages.remove(at: index)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.black)
                        }
                        .offset(x: 4, y: -4)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
}
