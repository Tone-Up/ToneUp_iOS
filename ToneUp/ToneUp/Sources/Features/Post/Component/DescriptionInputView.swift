//
//  DescriptionInputView.swift
//  ToneUp
//
//  Created by 전준영 on 5/25/25.
//

import SwiftUI

struct DescriptionInputView: View {
    
    @Binding var description: String

    var body: some View {
        VStack(alignment: .leading,
               spacing: 4) {
            Text("설명")
                .font(.caption)
                .foregroundColor(.gray)

            ZStack(alignment: .topLeading) {
                TextEditor(text: $description)
                    .padding(8)
                    .frame(height: 200)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray.opacity(0.2))
                    )
                    .onChange(of: description) { newValue in
                        if newValue.count > 200 {
                            description = String(newValue.prefix(200))
                        }
                    }

                if description.isEmpty {
                    Text("내용을 입력해주세요")
                        .foregroundColor(.gray)
                        .padding(.top, 12)
                        .padding(.horizontal, 14)
                        .font(.body)
                }
            }

            Text("\(description.count)/200")
                .font(.caption2)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
    }
    
}
