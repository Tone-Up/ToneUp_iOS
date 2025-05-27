//
//  RecommandQueryParameters.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct RecommandQueryParameters: QueryStringProtocol {
    
    let cursor: Int
    let limit: Int
    let sort: String
    
    func asQueryItems() -> [String : Any] {
        var items: [String : Any] = [:]
        
        items["cursor"] = cursor
        items["limit"] = limit
        items["sort"] = sort
        
        return items
    }
    
}
