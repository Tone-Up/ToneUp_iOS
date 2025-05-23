//
//  StyleRecordSection.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI

struct StyleRecordSection: View {
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 8) {
            SectionHomeHeader(title: AppText
                .HomeView
                .myStyle
                .rawValue)

            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(["여의의 코디", "나만의 코디", "여자친구의 코디"], id: \.self) { title in
                        Text(title)
                            .customFont(.notoSemiBold20)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(.white)
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
}

#Preview {
    StyleRecordSection()
}
