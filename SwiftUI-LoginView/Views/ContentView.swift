//
//  ContentView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import UIKit
import Firebase


enum pageState {
    case onboarding
    case login
    case main
}

struct ContentView: View {
    @ObservedObject var session = EmailAuthenticationCntroller()
    @State var showingPage = false
    
    var body: some View {
        ZStack {
            if showingPage {
                LoginView(session: session)
                    .animation(.spring())
                    .transition(.move(edge: .bottom))
            }
            else {
                OnboardingView(presentLoginView: {
                    withAnimation {
                        self.showingPage = true
                    }
                })
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }
        }
        .onAppear {
            self.session.initSession()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
