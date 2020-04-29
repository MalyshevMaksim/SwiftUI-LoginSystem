//
//  ContentView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase


enum pageState {
    case onboarding
    case login
    case main
}

struct ContentView: View {
    @ObservedObject var session = EmailAuthenticationCntroller()
    
    // when entering the application, by default we show onboadring
    @State private var currentPage: pageState = .onboarding
    
    var body: some View {
        ZStack {
            containedView()
        }
        .onAppear {
            // initialize the session when logging in to the app
            self.session.initSession()
            
            // if the user was logged in, we give them access to the main page
            if self.session.isLogin == true {
                self.currentPage = .main
            }
        }
    }
    
    func containedView() -> AnyView {
       switch currentPage {
       case .onboarding:
            return AnyView(OnboardingView(currentPage: $currentPage))
       case .login:
            return AnyView(LoginView(session: session, currentPage: $currentPage))
       case .main:
            return AnyView(MainPageView(session: session, currentPage: $currentPage))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
