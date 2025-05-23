//
//  ProfileTabBar.swift
//  ToneUp
//
//  Created by 전준영 on 5/23/25.
//

import SwiftUI

struct ProfileTabBar: View {
    
    @Binding var selectedTab: ProfileTab
    let postCount: Int
    let styleCount: Int
    let isMine: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            tabButton(title: "게시물",
                      count: postCount,
                      tab: .post)
            
            if isMine {
                tabButton(title: "내 스타일",
                          count: styleCount,
                          tab: .style)
            }
        }
        .padding(.vertical, 8)
        .background(.white)
    }
    
    @ViewBuilder
    private func tabButton(title: String,
                           count: Int,
                           tab: ProfileTab) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 2) {
                Text("\(count)")
                    .customFont(selectedTab == tab ? .notoBold14 : .notoRegular14)
                    .foregroundColor(selectedTab == tab ? .black : .gray)
                
                Text(title)
                    .customFont(selectedTab == tab ? .notoBold14 : .notoRegular14)
                    .foregroundColor(selectedTab == tab ? .black : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}
