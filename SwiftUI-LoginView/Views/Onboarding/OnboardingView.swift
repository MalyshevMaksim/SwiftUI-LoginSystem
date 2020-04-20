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
    
    var buttonGradient = LinearGradient(gradient: Gradient(
        colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var titleTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
            .combined(with: .opacity)
        return transition
    }

    var body: some View {
        VStack {
            Spacer()
            
            Text("Welcome to App!")
                .font(.title)
                .bold()
                .padding()
                .animation(Animation.spring().delay(0.3))
                .transition(titleTransition)
            
            OnboardingListView(artists.map { OnboardingPageView(pageData: $0) })
            Spacer()
            Spacer()
            Button(action: { self.isGetStarted = false }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(buttonGradient)
                    Text("Get Started")
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(width: 250, height: 50, alignment: .center)
            }
            Spacer()
        }
    }
}

struct OnboardingViewController_Previews: PreviewProvider {
    @State static var isGetStarted = true
    static var previews: some View {
        OnboardingViewController(isGetStarted: $isGetStarted)
    }
}
