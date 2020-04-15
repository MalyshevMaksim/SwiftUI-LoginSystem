//
//  OnboardingView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

var artists = [
    OnboardingPageView(image: "Billie", title: "Billie Elish", text: "Американская певица и автор песен. Снискала известность в 2016 году благодаря публикации дебютного сингла «Ocean Eyes» на SoundCloud."),
    OnboardingPageView(image: "Eminem", title: "Eminem", text: "Американская певица и автор песен. Снискала известность в 2016 году благодаря публикации дебютного сингла «Ocean Eyes» на SoundCloud."),
    OnboardingPageView(image: "OneRepublic", title: "OneRepublic", text: "Американская певица и автор песен. Снискала известность в 2016 году благодаря публикации дебютного сингла «Ocean Eyes» на SoundCloud.")
]

struct OnboardingView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    
    var body: some View {
        ZStack {
            Color.init(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1))
            PageViewController(viewControllers: viewControllers)
        }
        .frame(width: 320, height: 450, alignment: .center)
        .cornerRadius(25)
        .shadow(color: Color.init(#colorLiteral(red: 0.8736248016, green: 0.8737716079, blue: 0.8736054301, alpha: 1)), radius: 20, x: 0, y: 0)
    }
    
    init(_ view : [Page]) {
        self.viewControllers = view.map { UIHostingController(rootView: $0)}
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(artists)
    }
}
