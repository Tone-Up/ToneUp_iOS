//
//  ProductViewCell.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI

struct ProductViewCell: View {
    
    @State private var isLiked: Bool = true
    
    var image: Image = Image.onboardingImage
    var brand: String = "브랜드명"
    var name: String = "상품명"
    var price: String = "89,000원"

    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .bottomTrailing) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 160)
                    .clipped()
                    .cornerRadius(8)

                CommonButton(
                    icon: Image(systemName: isLiked ? "heart.fill" : "heart"),
                    backgroundColor: .clear,
                    text: nil,
                    textColor: .clear,
                    symbolColor: .red,
                    cornerRadius: 0,
                    hasInternalPadding: false
                ) {
                    isLiked.toggle()
                }
                .padding(6)
                .frame(width: 24, height: 24)
            }

            CommonText(text: brand,
                       font: .bold12,
                       color: .gray)
                .lineLimit(1)
                .frame(maxWidth: .infinity,
                       alignment: .leading)

            CommonText(text: name,
                       font: .regular14,
                       color: .black)
                .lineLimit(1)
                .frame(maxWidth: .infinity,
                       alignment: .leading)

            CommonText(text: price,
                       font: .bold13,
                       color: .black)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
        .frame(width: 120)
    }
    
}

#Preview {
    ProductViewCell()
}
