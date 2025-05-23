//
//  RecommendSection.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI

struct RecommendSection: View {
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 4) {
            SectionHomeHeader(title: AppText
                .HomeView
                .recommend
                .rawValue)
            
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<5) { _ in
                        ProductViewCell()
                    }
                }
                .padding(.horizontal)
                .background(.white)
            }
        }
    }
    
}

#Preview {
    RecommendSection()
}
