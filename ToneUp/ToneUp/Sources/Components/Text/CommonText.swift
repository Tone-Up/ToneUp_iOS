//
//  CommonText.swift
//  ToneUp
//
//  Created by 전준영 on 5/16/25.
//

import SwiftUI

struct CommonText: View {
    
    let text: String
    var font: FontType = .regular12
    var color: Color = .black
    
    var body: some View {
        Text(text)
            .customFont(font)
            .foregroundColor(color)
    }
    
}

#Preview {
    CommonText(text: "ToneUp")
}
