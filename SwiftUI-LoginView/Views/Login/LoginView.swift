//
//  LoginView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

var buttonGradient = LinearGradient(
    gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing)

struct LoginView: View {
    @State private var isPagePresented = false
    
    var backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
        startPoint: .leading,
        endPoint: .trailing)
    
    var customTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
          .combined(with: .opacity)
        return transition
    }
    
    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                Spacer()
                if isPagePresented {
                    ZStack {
                        Color.white
                        VStack {
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color.init(#colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)))
                                .frame(width: 60, height: 5, alignment: .center)
                                .padding()
                        
                                LoginPageView()
                                    .animation(.spring())
                                    .transition(customTransition)
                        }
                    }
                    .frame(height: 570)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .animation(Animation.spring())
                    .transition(customTransition)
                }
            }
        }
        .onAppear {
            self.isPagePresented = true
        }
        .animation(Animation.spring())
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
