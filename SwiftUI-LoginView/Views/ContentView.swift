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
            if showingPage {
                LoginView(session: session)
                    .animation(.spring())
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .scale))
            }
            else {
                OnboardingView(presentLoginView: {
                    withAnimation {
                        self.showingPage = true
                    }
                })
                    .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                        .combined(with: .scale))
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
