//
//  OnboardingModel.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 19.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation

var pageViewControllers = [
    OnboardingPageModel(imageName: "google", headerText: "Google Sign-In", description: "You can let your users authenticate with Firebase using their Google Accounts by integrating Google Sign-In into your app."),
    OnboardingPageModel(imageName: "apple", headerText: "Sign in with Apple", description: "You can let your users authenticate with Firebase using their Apple ID by using the Firebase SDK to carry out the end-to-end OAuth 2.0 sign-in flow."),
    OnboardingPageModel(imageName: "password", headerText: "Password", description: "You can use Firebase Authentication to let your users authenticate with Firebase using their email addresses and passwords, and to manage your app's password-based accounts.")
]

struct OnboardingPageModel {
    var imageName: String
    var headerText: String
    var description: String
    
    init(imageName: String, headerText: String, description: String) {
        self.imageName = imageName
        self.headerText = headerText
        self.description = description
    }
}
