//
//  ReportRequestBody.swift
//  ToneUp
//
//  Created by 전준영 on 6/1/25.
//

import Foundation

struct ReportRequestBody: Encodable {
    
    let reason: String
    let description: String?
    
}
