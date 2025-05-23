//
//  LikedView.swift
//  ToneUp
//
//  Created by 전준영 on 5/22/25.
//

import SwiftUI
import ComposableArchitecture

struct LikedView: View {
    
    @Bindable var store: StoreOf<Like>
    @State private var selectedTab: LikedTab = .feed
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.mainBackground)
                
                VStack(spacing: 0) {
                    LikedTabBar(selectedTab: $selectedTab)
                    
                    Spacer()
                    
                    ScrollView {
                        if selectedTab == .feed {
                            ThreeColumnGrid(items: 12) { _ in
                                FeedImageTile(image: .onboardingImage,
                                              width: UIScreen.main.bounds.width / 3,
                                              height: 200)
                                .background(.white)
                            }
                        } else {
                            ThreeColumnGrid(items: 12) { _ in
                                ProductViewCell(width: UIScreen.main.bounds.width / 3,
                                                height: 200)
                                    .background(.white)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .customNavigationBar(
                title: AppText.NavigationText.like.rawValue,
                trailing: .searchButton {
                    
                }
            )
        }
    }
}

#Preview {
    LikedView(
        store: Store(initialState: Like.State()) {
            Like()
        }
    )
}
