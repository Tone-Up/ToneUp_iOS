//
//  ThreeColumnGrid.swift
//  ToneUp
//
//  Created by 전준영 on 5/22/25.
//

import SwiftUI

struct ThreeColumnGrid<Content: View>: View {
    
    let items: Int
    let content: (Int) -> Content

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    init(items: Int, @ViewBuilder content: @escaping (Int) -> Content) {
        self.items = items
        self.content = content
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(0..<items, id: \.self) { index in
                content(index)
            }
        }
    }
    
}
