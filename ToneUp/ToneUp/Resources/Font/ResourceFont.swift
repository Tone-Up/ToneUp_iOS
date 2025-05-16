//
//  ResourceFont.swift
//  ToneUp
//
//  Created by 전준영 on 5/16/25.
//

import SwiftUI

//MARK: - 앱에서 사용할 폰트
enum NotoSansKR {
    static let notoThin = "NotoSansKR-Thin"
    static let notoLight = "NotoSansKR-Light"
    static let notoRegular = "NotoSansKR-Regular"
    static let notoMedium = "NotoSansKR-Medium"
    static let notoSemiBold = "NotoSansKR-SemiBold"
    static let notoBold = "NotoSansKR-Bold"
}


enum FontType {
    case system(CGFloat, weight: Font.Weight = .regular)
    case custom(name: String, size: CGFloat)
    
    var swiftUIFont: Font {
        switch self {
        case .system(let size, let weight):
            return .system(size: size, weight: weight)
        case .custom(let name, let size):
            return .custom(name, size: size)
        }
    }
}

extension FontType {
    //noto
    static let notoRegular18 = FontType.custom(name: NotoSansKR.notoRegular, size: 18)
    static let notoMedium60 = FontType.custom(name: NotoSansKR.notoMedium, size: 60)
    //regular
    static let regular12 = FontType.system(12, weight: .regular)
    //bold
    static let bold13 = FontType.system(13, weight: .bold)
}
