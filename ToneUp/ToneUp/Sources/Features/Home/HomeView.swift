//
//  HomeView.swift
//  ToneUp
//
//  Created by 전준영 on 5/18/25.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    @Bindable var store: StoreOf<Home>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.mainBackground)
                
                ScrollView {
                    VStack(spacing: 8) {
                        PersonalToneView(tone: .summer)
                        
                        RecommendSection()
                        
                        StyleRecordSection()
                        
                        SharedStyleSection()
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .customNavigationBar(
                title: AppText.NavigationText.home.rawValue,
                trailing: .searchButton {
                    
                }
            )
        }
    }
    
}

#Preview {
    HomeView(
        store: Store(initialState: Home.State()) {
            Home()
        }
    )
}
