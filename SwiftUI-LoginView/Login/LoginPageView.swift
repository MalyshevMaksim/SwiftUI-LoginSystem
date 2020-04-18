//
//  LoginPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginPageView: View {
    @Binding var isLogin: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var confirmemail = ""
    
    var buttonGradient = LinearGradient(
        gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            Text(isLogin ? "Login to account" : "Create an account")
                .font(.system(size: 24))
                .bold()
                .padding(.bottom, 5)
            Text("Please enter your credentials")
                .foregroundColor(.secondary)
            
            Spacer()
            
            VStack {
                TextFieldView(string: $email, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
                    .padding()
                    .padding(.horizontal, 25)
                TextFieldView(string: $password, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                    .padding()
                    .padding(.horizontal, 25)
                
                if !isLogin {
                    TextFieldView(string: $password, header: "Confirm password", placeholder: "Confirm your password", iconName: "repeat")
                    .padding()
                    .padding(.horizontal, 25)
                }
            }
            .padding(.bottom, 30)
            Spacer()
            
            VStack {
                Button(action: {}) {
                    Rectangle()
                        .fill(buttonGradient)
                        .frame(width: 270, height: 50, alignment: .center)
                        .overlay(
                            Text(isLogin ? "Sign in" : "Continue")
                                .foregroundColor(.white)
                                .bold())
                        .cornerRadius(15)
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text(isLogin ? "No account ?" : "Already have an account ?")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Button(action: { self.isLogin.toggle() }) {
                        Text(isLogin ? "Swipe Up" : "Swipe Down")
                            .bold()
                            .font(.subheadline)
                    }
                }
            }
            .padding(.bottom, 50)
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    @State static private var test = true
    static var previews: some View {
        LoginPageView(isLogin: $test)
    }
}
