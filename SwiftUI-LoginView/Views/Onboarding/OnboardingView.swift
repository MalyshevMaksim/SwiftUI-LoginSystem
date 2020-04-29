//
//  OnboardingViewController.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var currentPage: pageState

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                Text("Auth application")
                    .font(.title)
                    .bold()
                    .padding()
                    .animation(Animation.spring().delay(0.3))
                    
                Spacer()
                
                OnboardingListView(artists.map { OnboardingPageView(pageData: $0) })
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.65)
                Spacer()
                Spacer()
                
                FillButton(text: "Get Started", action: {
                    self.currentPage = .login
                })
                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.07, alignment: .center)
                Spacer()
            }
        }
    }
}

struct OnboardingViewController_Previews: PreviewProvider {
    @State static var page: pageState = .onboarding
    static var previews: some View {
        OnboardingView(currentPage: $page)
    }
}
