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
    private let launchKeyForOnboarding = "isOnboardingWasSkipped"
    
    init() {
        // Get the session object when entering the application
        userSession.initialSession()
    }
    
    var body: some View {
        ZStack {
            // Give access to the main page of the application, if the user is logged in
            if userSession.isValid() {
                MainPageView(session: userSession).modifier(PageModifier())
            }
            else {
                // Did not show the onboarding screen if it has already been viewed
                if isLoginPagePresented || UserDefaults.standard.bool(forKey: launchKeyForOnboarding) {
                    LoginView(session: userSession).modifier(PageModifier())
                }
                else {
                    OnboardingView(presentLoginView: {
                        // Remember that the onboarding screen has already been viewed
                        UserDefaults.standard.set(true, forKey: self.launchKeyForOnboarding)
                        
                        withAnimation {
                            self.isLoginPagePresented = true
                        }
                    }).modifier(PageModifier())
                }
            }
        }
    }
}

struct PageModifier: ViewModifier {
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
