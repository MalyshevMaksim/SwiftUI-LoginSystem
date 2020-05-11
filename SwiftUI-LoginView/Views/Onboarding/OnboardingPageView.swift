//
//  OnboardingPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct OnboardingPageView: View {
    @State private var presentedPage = false
    @State private var presentedDetail = false
    let pageData: OnboardingPageModel
    
    var pageTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .trailing)
            .combined(with: .scale(scale: 0.1, anchor: .trailing))
            .combined(with: .opacity)
        return transition
    }
    
    var body: some View {
        VStack {
            Image(pageData.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90, alignment: .center)
                .padding()
            
            if presentedPage {
                Text(pageData.headerText)
                    .bold()
                    .frame(width: 300)
                    .font(.system(size: 22))
                    .animation(Animation.spring().delay(0.1))
                    .transition(pageTransition)
            }
            
            if presentedPage {
                Text(pageData.description)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .padding(.horizontal)
                    .animation(Animation.spring().delay(0.2))
                    .transition(pageTransition)
            }
            
            Button(action: { self.presentedDetail = true }) {
                Text("Show more info")
                    
            }
            .sheet(isPresented: $presentedDetail, content: {
                OnboardingDetailView()
            })
            .padding()
        }
        .onAppear {
            self.presentedPage = true
        }
        .onDisappear {
            self.presentedPage = false
        }
        .animation(.spring())
        .transition(pageTransition)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(pageData: OnboardingPageModel(imageName: "password", headerText: "Billie Elish", description: "Американская певица и автор песен. Снискала известность в 2016 году благодаря публикации дебютного сингла «Ocean Eyes» на SoundCloud."))
    }
}
