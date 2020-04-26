//
//  OnboardingView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

var artists = [
    
    OnboardingPageModel(imageName: "google", headerText: "Google Sign-In", description: "You can let your users authenticate with Firebase using their Google Accounts by integrating Google Sign-In into your app."),
    OnboardingPageModel(imageName: "apple", headerText: "Sign in with Apple", description: "You can let your users authenticate with Firebase using their Apple ID by using the Firebase SDK to carry out the end-to-end OAuth 2.0 sign-in flow."),
    OnboardingPageModel(imageName: "password", headerText: "Password", description: "You can use Firebase Authentication to let your users authenticate with Firebase using their email addresses and passwords, and to manage your app's password-based accounts.")
]

struct OnboardingListView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.init(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1))
            PageViewController(viewControllers: self.viewControllers, currentPage: self.$currentPage)
            PageControl(numberOfPage: self.viewControllers.count, currentPage: self.$currentPage)
                .padding(10)
        }

        .cornerRadius(25)
        .shadow(color: Color.init(#colorLiteral(red: 0.8736248016, green: 0.8737716079, blue: 0.8736054301, alpha: 1)), radius: 20, x: 0, y: 0)
    }
    
    init(_ view : [Page]) {
        self.viewControllers = view.map { UIHostingController(rootView: $0)}
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingListView(artists.map { OnboardingPageView(pageData: $0) })
    }
}
