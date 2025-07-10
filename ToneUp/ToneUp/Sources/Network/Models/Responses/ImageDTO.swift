//
//  ImageDTO.swift
//  ToneUp
//
//  Created by 전준영 on 7/9/25.
//

import Foundation

struct ImageDTO: Decodable {
    
    let files: [ImageFilesDTO]
    
}

struct ImageFilesDTO: Decodable {
    
    let fileName: String
    let uploadUrl: String
    let fileUrl: String
    
}
