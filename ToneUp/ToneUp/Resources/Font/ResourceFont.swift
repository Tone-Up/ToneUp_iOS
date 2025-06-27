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
    case predefined(Font)
    
    var swiftUIFont: Font {
        switch self {
        case .system(let size, let weight):
            return .system(size: size, weight: weight)
            
        case .custom(let name, let size):
            return .custom(name, size: size)
            
        case .predefined(let font):
            return font
        }
    }
}

extension FontType {
    //noto
    static let notoRegular14 = FontType
        .custom(name: NotoSansKR.notoRegular,
                size: 14)
    static let notoRegular15 = FontType
        .custom(name: NotoSansKR.notoRegular,
                size: 15)
    static let notoRegular18 = FontType
        .custom(name: NotoSansKR.notoRegular,
                size: 18)
    static let notoMedium28 = FontType
        .custom(name: NotoSansKR.notoMedium,
                size: 28)
    static let notoMedium60 = FontType
        .custom(name: NotoSansKR.notoMedium,
                size: 60)
    static let notoSemiBold12 = FontType
        .custom(name: NotoSansKR.notoSemiBold,
                size: 12)
    static let notoSemiBold20 = FontType
        .custom(name: NotoSansKR.notoSemiBold,
                size: 20)
    static let notoSemiBold40 = FontType
        .custom(name: NotoSansKR.notoSemiBold,
                size: 40)
    static let notoBold14 = FontType
        .custom(name: NotoSansKR.notoBold,
                size: 14)
    static let notoBold15 = FontType
        .custom(name: NotoSansKR.notoBold,
                size: 15)
    static let notoBold16 = FontType
        .custom(name: NotoSansKR.notoBold,
                size: 16)
    static let notoBold20 = FontType
        .custom(name: NotoSansKR.notoBold,
                size: 20)
    static let notoBold32 = FontType
        .custom(name: NotoSansKR.notoBold,
                size: 32)
    
    //regular
    static let regular12 = FontType
        .system(12,
                weight: .regular)
    static let regular14 = FontType
        .system(14,
                weight: .regular)
    static let regular20 = FontType
        .system(20,
                weight: .regular)
    //bold
    static let bold12 = FontType
        .system(12,
                weight: .bold)
    static let bold13 = FontType
        .system(13,
                weight: .bold)
    // predefined (SwiftUI 기본값)
    static let headline = FontType
        .predefined(.headline)
    static let body = FontType
        .predefined(.body)
    static let title = FontType
        .predefined(.title)
    static let caption = FontType
        .predefined(.caption)
}
