//
//  OnboardingPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct OnboardingPageView: View {
    @State private var isApp = false
    @State private var isDetailPresented = false
    
    var imageName: String
    var title: String
    var text: String
    
    var customTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .trailing)
            .combined(with: .scale(scale: 0.1, anchor: .trailing))
            .combined(with: .opacity)
      return transition
    }
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            
            if isApp {
                Text(title)
                    .bold()
                    .frame(width: 300)
                    .font(.system(size: 22))
                    .animation(Animation.spring().delay(0.1))
                    .transition(customTransition)
            }
            
            if isApp {
                Text(text)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .animation(Animation.spring().delay(0.2))
                    .transition(customTransition)
            }
            
            Button(action: { self.isDetailPresented = true }) {
                Text("Show more info")
                    .bold()
                    .font(.headline)
            }
            .sheet(isPresented: $isDetailPresented, content: {
                OnboardingDetailView()
            })
            .padding(10)
        }
        .onAppear {
            self.isApp = true
        }
        .onDisappear {
            self.isApp = false
        }
        .animation(.spring())
        .transition(customTransition)
    }
    
    init(image: String, title: String, text: String) {
        self.imageName = image
        self.title = title
        self.text = text
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(image: "Billie", title: "Billie Elish", text: "Американская певица и автор песен. Снискала известность в 2016 году благодаря публикации дебютного сингла «Ocean Eyes» на SoundCloud.")
    }
}
