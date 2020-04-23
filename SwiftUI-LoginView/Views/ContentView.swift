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
    @State private var isHOME = false
    @State private var test = false
    @ObservedObject var session = EmailAuthenticationCntroller()
    
    var titleTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
        return transition
    }
    
    var body: some View {
        ZStack {
            if session.isLogin {
                Button(action: {
                    self.session.logout()
                })
                {
                    Text("Logout")
                }
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
            self.isHOME = true
        }
    }
    
    init() {
        session.listener()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
