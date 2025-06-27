//
//  AppText.swift
//  ToneUp
//
//  Created by 전준영 on 5/16/25.
//

import Foundation

enum AppText {
    
    enum Logo: String {
        case title = "TONE UP"
    }
    
    enum Onboarding: String {
        case subTitle = "나만의 스타일로 시작해 보세요"
    }
    
    enum HomeView: String {
        case recommend = "AI가 제안하는 코디 상품"
        case myStyle = "오늘의 스타일 기록 남기기"
        case feed = "오늘의 스타일을 공유해 보세요"
    }
    
    enum NavigationText: String {
        case home = "Tone Up_"
        case like = "Liked_"
        case profile = "My Profile_"
        case chat = "Chat_"
        case setProfile = "프로필 관리"
    }
    
    enum AnalyzeView: String {
        case title = "나만의 톤을\n찾아볼까요?"
        case subTitle = "톤업은 당신만의 색을 존중합니다.\n지금, 내 퍼스널컬러를 확인해보세요."
    }
}
