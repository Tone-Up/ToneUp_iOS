//
//  TitleInputView.swift
//  ToneUp
//
//  Created by 전준영 on 5/25/25.
//

import SwiftUI

struct TitleInputView: View {
    
    @Binding var title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("제목")
                .font(.caption)
                .foregroundColor(.gray)

            TextField("제목을 입력해주세요", text: $title)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .onChange(of: title) { newValue in
                    if newValue.count > 20 {
                        title = String(newValue.prefix(20))
                    }
                }

            Text("\(title.count)/20")
                .font(.caption2)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
    }
    
}
