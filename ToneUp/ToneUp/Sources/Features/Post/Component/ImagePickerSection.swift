//
//  ImagePickerSection.swift
//  ToneUp
//
//  Created by 전준영 on 5/25/25.
//

import SwiftUI

struct ImagePickerSection: View {
    
    @Binding var images: [UIImage]
    
    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false) {
            HStack(spacing: 8) {
                Button {
                    
                } label: {
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
                
                ForEach(images.indices, id: \.self) { index in
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                            .cornerRadius(6)
                        
                        Button(action: {
                            images.remove(at: index)
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
