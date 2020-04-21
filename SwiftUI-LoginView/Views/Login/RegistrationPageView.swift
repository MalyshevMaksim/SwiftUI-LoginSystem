//
//  RegistrationView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 21.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct RegistrationPageView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Please enter your credentials")
                        .foregroundColor(.secondary)
                        .animation(.none)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.topLeading)
                .padding(.horizontal, 20)

                Spacer()
                
                VStack {
                    TextFieldView(string: $email, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                    TextFieldView(string: $password, passwordMode: true, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                    TextFieldView(string: $confirmPassword, passwordMode: true, header: "Confirm password", placeholder: "Confirm your password", iconName: "repeat")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 30)
                Spacer()
                
                VStack {
                    Button(action: {
                        
                    }) {
                        Rectangle()
                            .fill(buttonGradient)
                            .frame(width: 300, height: 50, alignment: .center)
                            .overlay(
                                Text("Continue")
                                    .foregroundColor(.white)
                                    .bold())
                                    .animation(.none)
                            .cornerRadius(15)
                    }
                }
            }
            .navigationBarTitle("Sign Up")
            .padding(.bottom, 50)
        }
    }
}

struct RegistrationPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPageView()
    }
}
