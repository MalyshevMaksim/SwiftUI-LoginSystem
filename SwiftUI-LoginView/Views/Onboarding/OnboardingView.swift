//
//  OnboardingViewController.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct OnboardingViewController: View {
    @Binding var isGetStarted: Bool
    
    var titleTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
            .combined(with: .opacity)
        return transition
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Spacer()
                Text("Auth application")
                    .font(.title)
                    .bold()
                    .padding()
                    .animation(Animation.spring().delay(0.3))
                    .transition(self.titleTransition)
                    
                Spacer()
                
                OnboardingListView(artists.map { OnboardingPageView(pageData: $0) })
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.65)
                Spacer()
                Spacer()
                
                FillButton(text: "Get Started", action: {
                    self.isGetStarted = false
                })
                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.07, alignment: .center)
                Spacer()
            }
        }
    }
}

struct OnboardingViewController_Previews: PreviewProvider {
    @State static var isGetStarted = true
    static var previews: some View {
        OnboardingViewController(isGetStarted: $isGetStarted)
    }
}
