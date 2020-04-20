//
//  LoginPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

enum pageStatesEnum {
    case registration
    case login
    case forgotPassword
}

struct LoginPageView: View {
    @Binding var pageState: pageStatesEnum
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var buttonGradient = LinearGradient(
        gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var body: some View {
        var title = ""
        var subtitle = ""
        var buttonText = ""
        var buttonSubtext = ""
        var swipeText = ""
        
        switch pageState {
            case .login:
                title = "Login to account"
                buttonText = "Sign in"
                buttonSubtext = "No account ?"
                subtitle = "Please enter your credentials"
                swipeText = "Swipe Up"
            case .registration:
                title = "Create an account"
                buttonText = "Continue"
                buttonSubtext = "Already have an account ?"
                subtitle = "Please enter your credentials"
                swipeText = "Swipe Down"
            case .forgotPassword:
                title = "Forgot your password ?"
                buttonText = "Continue"
                buttonSubtext = "Return to login ?"
                subtitle = "Please enter your email"
                swipeText = "Swipe Up"
        }
        
        return VStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 24))
                    .bold()
                    .padding(.bottom, 5)
                    .animation(.none)
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .animation(.none)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.topLeading)
            .padding(.horizontal, 40)

            Spacer()
            
            VStack {
                TextFieldView(string: $email, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
                    .padding(.vertical)
                    .padding(.horizontal, 40)
                if pageState != pageStatesEnum.forgotPassword {
                    TextFieldView(string: $password, passwordMode: true, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                        .padding(.vertical)
                        .padding(.horizontal, 40)
                }
                
                if pageState == pageStatesEnum.registration {
                    TextFieldView(string: $confirmPassword, passwordMode: true, header: "Confirm password", placeholder: "Confirm your password", iconName: "repeat")
                        .padding(.vertical)
                        .padding(.horizontal, 40)
                }
            }
            .padding(.bottom, 30)
            Spacer()
            
            VStack {
                Button(action: {}) {
                    Rectangle()
                        .fill(buttonGradient)
                        .frame(width: 300, height: 50, alignment: .center)
                        .overlay(
                            Text(buttonText)
                                .foregroundColor(.white)
                                .bold())
                                .animation(.none)
                        .cornerRadius(15)
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text(buttonSubtext)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Button(action: {
                        if self.pageState == .registration {
                            self.pageState = .login
                        }
                        else {
                            self.pageState = .registration
                        }
                    })
                    {
                        Text(swipeText)
                            .bold()
                            .font(.subheadline)
                    }
                }
                .animation(.none)
            }
            .padding(.bottom, 50)
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    @State static private var test = pageStatesEnum.login
    static var previews: some View {
        LoginPageView(pageState: $test)
    }
}
