//
//  PostRequestBody.swift
//  ToneUp
//
//  Created by 전준영 on 6/1/25.
//

import Foundation

struct PostRequestBody: Encodable {
    
    let title: String?
    let content: String
    let imageUrls: [String]
    
}
