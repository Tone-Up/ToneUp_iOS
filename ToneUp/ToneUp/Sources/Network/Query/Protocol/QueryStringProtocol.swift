//
//  QueryStringProtocol.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

protocol QueryStringProtocol {
    
    func asQueryItems() -> [String : Any]
    
}
