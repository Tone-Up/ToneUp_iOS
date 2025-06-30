//
//  ProfileView.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI

struct ProfileView: View {
    
    let isMine: Bool
    @State private var selectedTab: ProfileTab = .post
    
    var body: some View {
        ZStack {
            Color(UIColor.mainBackground)
            
            VStack(spacing: 8) {
                ProfileContentView(isMine: isMine)
                
                VStack(spacing: 0) {
                    ProfileTabBar(selectedTab: $selectedTab,
                                  postCount: 1,
                                  styleCount: 3,
                                  isMine: isMine)
                    
                    ScrollView {
                        if selectedTab == .post {
                            ThreeColumnGrid(items: 14) { _ in
                                FeedImageTile(image: .onboardingImage,
                                              width: UIScreen.main.bounds.width / 3,
                                              height: 200)
                                .background(.white)
                            }
                        } else if selectedTab == .style {
                            ThreeColumnGrid(items: 7) { _ in
                                FeedImageTile(image: .onboardingImage,
                                              isFeed: false,
                                              width: UIScreen.main.bounds.width / 3,
                                              height: 180)
                                .background(.white)
                            }
                        }
                    }
                    .id(selectedTab)
                }
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .customNavigationBar(
                title: isMine ? AppText.NavigationText.profile.rawValue : "",
                trailing: isMine ? .none : .none
            )
        }
    }
    
}

#Preview {
    ProfileView(isMine: true)
}
