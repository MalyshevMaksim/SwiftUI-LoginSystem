//
//  LoginView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var isPagePresented = false
    
    var customTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
        return transition
    }
    
    var body: some View {
        ZStack {
            if isPagePresented {
                LoginPageView()
                    .animation(.spring())
                    .transition(customTransition)
            }
        }
        .onAppear {
            self.isPagePresented = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
