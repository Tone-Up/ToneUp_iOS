//
//  CustomBackButtonModifier.swift
//  ToneUp
//
//  Created by 전준영 on 7/1/25.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) private var dismiss
    var color: Color = .black
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .renderingMode(.template)
                .foregroundColor(color)
                .shadow(radius: 2.0)
                .contentShape(Rectangle())
        }
    }
    
}

struct BackButtonModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton(color: color)
                }
            }
    }
    
}

public extension View {
    func addBackButton(_ color: Color = .black) -> some View {
        modifier(BackButtonModifier(color: color))
    }
}
