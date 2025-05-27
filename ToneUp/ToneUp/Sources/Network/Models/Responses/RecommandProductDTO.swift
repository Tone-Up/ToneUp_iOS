//
//  RecommandProductDTO.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct RecommandProductDTO: Decodable {
    
    let products: [String]
    let nextCursor: Int
    let hasNext: Bool
    
}
