//
//  ImagePickerSection.swift
//  ToneUp
//
//  Created by 전준영 on 5/25/25.
//

import SwiftUI
import PhotosUI

struct ImagePickerSection: View {
    
    @Binding var images: [UIImage]
    @State private var photoItems: [PhotosPickerItem] = []
    
    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false) {
            HStack(spacing: 8) {
                CustomPhotoPicker(
                    selectedItems: $photoItems,
                    selectedImages: $images,
                    maxCount: 5
                ) {
                    VStack {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(8)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                        Text("\(images.count)/5")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                
                ForEach(Array(zip(photoItems.indices, images)), id: \.0) { idx, uiImage in
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                            .cornerRadius(6)
                        
                        Button(action: {
                            photoItems.remove(at: idx)
                            images.remove(at: idx)
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
