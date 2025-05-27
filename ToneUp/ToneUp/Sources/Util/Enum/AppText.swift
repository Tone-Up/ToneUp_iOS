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
    
}
