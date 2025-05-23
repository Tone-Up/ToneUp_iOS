//
//  SectionHomeHeader.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI

struct SectionHomeHeader: View {
    
    let title: String

    var body: some View {
        CommonText(text: title,
                   font: .notoRegular18,
                   color: .black)
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
}

#Preview {
    SectionHomeHeader(title: "추천")
}
