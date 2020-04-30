//
//  Successful.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 28.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct Successful: View {
    @Binding var currentPage: resetPageState
    @Binding var presentedBinding: Bool
    @State private var isPresented = false
    
    var customTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
        return transition
    }
    
    var body: some View {
        ZStack {
            if isPresented == true {
                VStack {
                    Text("Successful")
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                    Image("asset3")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Password recovery instructions have been sent to your email.")
                        .foregroundColor(.secondary)
                        .padding(.vertical)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.center)
                    
                    FillButton(text: "Continue") {
                        self.presentedBinding = false
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                }
                .animation(.spring())
                .transition(customTransition)
            }
        }
        .onAppear {
            self.isPresented = true
        }
    }
}

struct Successful_Previews: PreviewProvider {
    @State static var bool = true
    @State static var test: resetPageState = .successful
    static var previews: some View {
        Successful(currentPage: $test, presentedBinding: $bool)
    }
}
