//
//  ContentView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var userSession = SessionCntroller()
    @State private var isLoginPagePresented = false
    private let isOnboardingWasSkipped = "isOnboardingWasSkipped"
    
    init() {
        userSession.initialSession()
    }
    
    var body: some View {
        ZStack {
            if userSession.isValid() {
                MainPageView(session: userSession).modifier(ScreenModifier())
            }
            else {
                if isOnboardingAlreadyShowing() {
                    LoginView(session: userSession).modifier(ScreenModifier())
                }
                else {
                    OnboardingView(onSkipped: {
                        UserDefaults.standard.set(true, forKey: self.isOnboardingWasSkipped)
                        
                        withAnimation {
                            self.isLoginPagePresented = true
                        }
                    }).modifier(ScreenModifier())
                }
            }
        }
    }

    private func isOnboardingAlreadyShowing() -> Bool {
        let isOnboardingAlreadyShowing = UserDefaults.standard.bool(forKey: self.isOnboardingWasSkipped)
        
        if isOnboardingAlreadyShowing {
            return true
        }
        else {
            return isLoginPagePresented
        }
    }
}

struct ScreenModifier: ViewModifier {
    func body(content: Content) -> some View {
        let appearanceTransition = AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)) .combined(with: .scale)
        return content
            .animation(.spring())
            .transition(appearanceTransition)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
