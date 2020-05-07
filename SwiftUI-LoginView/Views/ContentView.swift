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
    @ObservedObject var session = EmailAuthenticationCntroller()
    @State var showingPage = false
    
    var body: some View {
        ZStack {
            if session.isLogin == true {
                MainPageView(session: self.session)
                    .animation(.spring())
                    .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                    .combined(with: .scale))
            }
            else {
                if showingPage {
                    LoginView(session: session)
                        .animation(.spring())
                        .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                        .combined(with: .scale))
                }
                else {
                    OnboardingView(presentLoginView: {
                        withAnimation {
                            self.showingPage = true
                        }
                    })
                        .animation(.spring())
                        .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                        .combined(with: .scale))
                }
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
