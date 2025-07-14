//
//  FeedDTO.swift
//  ToneUp
//
//  Created by 전준영 on 7/11/25.
//

import Foundation

struct FeedDTO: Decodable, Equatable {
    
    let feeds: [FeedData]
    
}

struct FeedData: Decodable, Equatable {
    
    let feedId: Int
    let imageUrl: String
    let isLiked: Bool
    
}
