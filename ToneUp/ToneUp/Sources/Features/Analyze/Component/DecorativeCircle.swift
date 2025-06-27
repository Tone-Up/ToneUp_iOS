//
//  DecorativeCircle.swift
//  ToneUp
//
//  Created by 전준영 on 6/25/25.
//

import SwiftUI

struct DecorativeCircle: View {
    
    let color: Color
    let widthRatio: CGFloat /// 화면 너비 대비 지름 비율 (1.0 = 100%)
    let heightRatio: CGFloat /// 화면 높이 대비 지름 비율
    let xRatio: CGFloat /// 화면 X축 기준 위치 비율 (0 = 왼쪽, 1 = 오른쪽)
    let yRatio: CGFloat /// 화면 Y축 기준 위치 비율 (0 = 위쪽, 1 = 아래쪽)
    let xOffset: CGFloat /// 추가 오프셋값(픽셀)
    let yOffset: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            Circle()
                .fill(color)
                .frame(
                    width: geo.size.width * widthRatio,
                    height: geo.size.height * heightRatio
                )
                .position(
                    x: geo.size.width * xRatio + xOffset,
                    y: geo.size.height * yRatio + yOffset
                )
        }
    }
    
}
