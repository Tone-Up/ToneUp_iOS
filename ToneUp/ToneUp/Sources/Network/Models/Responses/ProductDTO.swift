//
//  ProductDTO.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct ProductDTO: Decodable {
    
    let productId: Int
    let productName: String
    let price: Int
    let imageUrl: String
    let productDetailUrl: String
    
}
