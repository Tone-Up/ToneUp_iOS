//
//  SharedStyleSection.swift
//  ToneUp
//
//  Created by 전준영 on 5/21/25.
//

import SwiftUI
import ComposableArchitecture

struct SharedStyleSection: View {
    
    @Bindable var store: StoreOf<Home>
    @ObservedObject var viewStore: ViewStoreOf<Home>
    let screenWidth = UIScreen.main.bounds.width
    
    init(store: StoreOf<Home>) {
        self._store = .init(store)
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 0) {
            SectionHomeHeader(title: AppText.HomeView.feed.rawValue)
                .padding(.bottom, 8)
            
            let items = viewStore.feed?.feeds ?? []
            
            ForEach(Array(stride(from: 0,
                                 to: items.count,
                                 by: 6)),
                    id: \.self) { baseIndex in
                let end = min(baseIndex + 6,
                              items.count)
                let group = Array(items[baseIndex..<end])
                let urls  = group.map(\.imageUrl)
                let isLeftBig = (baseIndex / 6) % 2 == 0
                
                TileGroupView(
                    imageUrls: urls,
                    isLeftBig: isLeftBig,
                    screenWidth: screenWidth
                )
            }
                    .background(.white)
        }
    }
}
