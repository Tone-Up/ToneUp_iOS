//
//  CustomNavigationBar.swift
//  ToneUp
//
//  Created by 전준영 on 5/18/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    let title: String
    let trailing: NavigationBarTrailingType
    
    var body: some View {
        HStack {
            CommonText(text: title,
                       font: .notoMedium28)
            
            Spacer()
            
            switch trailing {
            case .none:
                EmptyView()
                
            case .searchButton(let action):
                CommonButton(icon: Image(systemName: "magnifyingglass"),
                             backgroundColor: .clear,
                             text: nil,
                             textColor: .clear,
                             symbolColor: .black,
                             cornerRadius: 0) {
                    
                }
                
            case .customView(let view):
                view
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomNavigationBar(title: "Tone Up_",
                        trailing: .searchButton(action: {
        
    }))
}
