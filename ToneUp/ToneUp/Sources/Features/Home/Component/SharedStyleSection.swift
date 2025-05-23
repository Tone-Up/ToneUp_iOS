//
//  SharedStyleSection.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI

struct SharedStyleSection: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let images: [Image] = Array(repeating: Image.onboardingImage, count: 20)
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 0) {
            SectionHomeHeader(title: AppText.HomeView.feed.rawValue)
                .padding(.bottom, 8)
            
            ForEach(Array(stride(from: 0,
                                 to: images.count,
                                 by: 6)),
                    id: \.self) { baseIndex in
                let end = min(baseIndex + 6,
                              images.count)
                let group = Array(images[baseIndex..<end])
                let isLeftBig = (baseIndex / 6) % 2 == 0
                
                TileGroupView(
                    images: group,
                    isLeftBig: isLeftBig,
                    screenWidth: screenWidth
                )
            }
                    .background(.white)
        }
    }
}

#Preview {
    SharedStyleSection()
}
