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
    @State var presentedLoginPage = false
    private let initialLaunchKey = "isInitialLoginLaunch"
    
    init() {
        // Get the session object when entering the application
        session.initialSession()
    }
    
    var body: some View {
        ZStack {
            // Give access to the main page of the application, if the user is logged in
            if session.isLogin == true {
                MainPageView()
                    .animation(.spring())
                    .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                    .combined(with: .scale))
            }
            else {
                // Did not show the onboarding screen if it has already been viewed
                if presentedLoginPage || UserDefaults.standard.bool(forKey: "isInitialLoginLaunch") {
                    LoginView()
                        .animation(.spring())
                        .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                        .combined(with: .scale))
                }
                else {
                    OnboardingView(presentLoginView: {
                        // Remember that the onboarding screen has already been viewed
                        UserDefaults.standard.set(true, forKey: self.initialLaunchKey)
                        
                        withAnimation {
                            self.presentedLoginPage = true
                        }
                    })
                        .animation(.spring())
                        .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                        .combined(with: .scale))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
