//
//  CustomFontModifier.swift
//  ToneUp
//
//  Created by 전준영 on 5/16/25.
//

import SwiftUI

struct CustomFontModifier: ViewModifier {
    
    let fontType: FontType
    
    func body(content: Content) -> some View {
        content.font(fontType.swiftUIFont)
    }
    
}

extension View {
    
    func customFont(_ fontType: FontType) -> some View {
        self.modifier(CustomFontModifier(fontType: fontType))
    }
    
}
