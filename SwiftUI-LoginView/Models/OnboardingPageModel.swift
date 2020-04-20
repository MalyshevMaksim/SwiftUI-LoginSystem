//
//  OnboardingModel.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 19.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation

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
