//
//  ToneUpApp.swift
//  ToneUp
//
//  Created by 전준영 on 5/12/25.
//

import SwiftUI
import ComposableArchitecture
import GoogleSignIn

@main
struct ToneUpApp: App {
    
    var body: some Scene {
        WindowGroup {
            OnboardingView(
                store: Store(initialState: Onboarding.State()) {
                    Onboarding()
                }
            )
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
