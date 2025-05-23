//
//  Array+Extension.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
