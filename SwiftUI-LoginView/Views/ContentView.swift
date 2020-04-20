//
//  ContentView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isOnboarding = true

    var body: some View {
        return Group {
            if isOnboarding {
                OnboardingViewController(isGetStarted: $isOnboarding)
            }
            else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
