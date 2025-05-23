//
//  LikedTabBar.swift
//  ToneUp
//
//  Created by 전준영 on 5/22/25.
//

import SwiftUI

struct LikedTabBar: View {
    @Binding var selectedTab: LikedTab

    var body: some View {
        HStack(spacing: 16) {
            ForEach(LikedTab.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 4) {
                        Text(tab.title)
                            .font(.subheadline)
                            .foregroundColor(selectedTab == tab ? .black : .gray)

                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(selectedTab == tab ? .black : .clear)
                    }
                    .fixedSize()
                }
            }

            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 4)
//        .background(Color(UIColor.systemGray6))
    }
}
