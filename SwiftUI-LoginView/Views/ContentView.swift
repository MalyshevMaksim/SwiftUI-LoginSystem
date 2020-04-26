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
    @State private var isOnboarding = true
    @ObservedObject var session = EmailAuthenticationCntroller()
    
    var titleTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
        return transition
    }
    
    var body: some View {
        ZStack {
            if session.isLogin ?? false {
                MainPageView(session: self.session)
            }
            else {
                if isOnboarding {
                    OnboardingViewController(isGetStarted: $isOnboarding)
                }
                else {
                    LoginView()
                }
            }
        }
        .onAppear {
            self.session.initTest()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
