//
//  LikedTab.swift
//  ToneUp
//
//  Created by 전준영 on 5/22/25.
//

import Foundation

enum LikedTab: CaseIterable {
    case feed, product
    
    var title: String {
        switch self {
        case .feed: return "피드 10"
        case .product: return "상품 2"
        }
    }
}
