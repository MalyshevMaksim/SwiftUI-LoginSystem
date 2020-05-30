//
//  OnboardingViewController.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    var onSkipped: (()->()) = {}

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                Text("Auth application")
                    .font(.title)
                    .bold()
                    .padding()
                    
                Spacer()
                
                OnboardingListView(pageViewControllers.map { OnboardingPageView(pageData: $0) })
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.65)
                Spacer()
                Spacer()
                
                Button(action: { self.onSkipped() }) {
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        .frame(height: 50, alignment: .center)
                        .overlay(Text("Get Started").foregroundColor(.white).bold())
                        .cornerRadius(8)
                }
                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.07, alignment: .center)
                Spacer()
            }
        }
    }
    
}

struct OnboardingViewController_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
