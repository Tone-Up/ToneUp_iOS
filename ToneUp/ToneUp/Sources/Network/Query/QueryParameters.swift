//
//  QueryParameters.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

struct QueryParameters: QueryStringProtocol {
    
    let query: String?
    let cursor: Int?
    let limit: Int?
    let sort: String?
    
    init(query: String? = nil,
         cursor: Int? = nil,
         limit: Int? = nil,
         sort: String? = nil) {
        self.query = query
        self.cursor = cursor
        self.limit = limit
        self.sort = sort
    }
    
    func asQueryItems() -> [String : Any] {
        var items: [String : Any] = [:]
        
        if let query = query {
            items["query"] = query
        }
        
        if let cursor = cursor {
            items["cursor"] = cursor
        }
        
        if let limit = limit {
            items["limit"] = limit
        }
        
        if let sort = sort {
            items["sort"] = sort
        }
        
        return items
    }
    
}
