//
//  ToneUpApp.swift
//  ToneUp
//
//  Created by 전준영 on 5/12/25.
//

import SwiftUI
import Firebase
import ComposableArchitecture
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct ToneUpApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
//            OnboardingView(
//                store: Store(initialState: Onboarding.State()) {
//                    Onboarding()
//                }
//            )
//            AnalyzeView(
//                store: Store(initialState: Analyze.State()) {
//                    Analyze()
//                }
//            )
            CustomTabView()
            .onOpenURL { url in
                GIDSignIn.sharedInstance.handle(url)
            }
        }

        //        WindowGroup {
        //            HomeView(
        //                store: Store(initialState: Home.State()) {
        //                    Home()
        //                }
        //            )
        //        }
    }

}
