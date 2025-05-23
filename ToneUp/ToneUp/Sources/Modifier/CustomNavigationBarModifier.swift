//
//  CustomNavigationBarModifier.swift
//  ToneUp
//
//  Created by 전준영 on 5/18/25.
//

import SwiftUI

enum NavigationBarTrailingType {
    case none
    case searchButton(action: () -> Void)
    case customView(AnyView)
}

struct CustomNavigationBarModifier: ViewModifier {
    
    let title: String
    let trailingType: NavigationBarTrailingType
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    CommonText(text: title,
                               font: .notoMedium28)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    switch trailingType {
                    case .none:
                        EmptyView()
                        
                    case .searchButton(let action):
                        CommonButton(icon: Image(systemName: "magnifyingglass"),
                                     backgroundColor: .clear,
                                     text: nil,
                                     textColor: .clear,
                                     symbolColor: .black,
                                     cornerRadius: 0,
                                     hasInternalPadding: false) {
                            
                        }
                        
                    case .customView(let view):
                        view
                    }
                }
            }
    }
}

extension View {
    func customNavigationBar(
        title: String,
        trailing: NavigationBarTrailingType = .none
    ) -> some View {
        self.modifier(CustomNavigationBarModifier(title: title,
                                                  trailingType: trailing))
    }
}
