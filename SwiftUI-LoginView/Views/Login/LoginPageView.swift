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
    @State private var isPresenter = false
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Please enter your credentials")
                        .foregroundColor(.secondary)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.topLeading)
                .padding(.horizontal, 20)

                Spacer()
                
                VStack {
                    TextFieldView(string: $email, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                    TextFieldView(string: $password, passwordMode: true, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                }
                Spacer()
                
                VStack {
                    Button(action: {
                        session.login(email: self.email, password: self.password) { (result, error) in
                            if error != nil {
                                print("Error!")
                            }
                            else {
                                print("Succesfull")
                            }
                        }
                    }) {
                        Rectangle()
                            .fill(buttonGradient)
                            .frame(width: 300, height: 50, alignment: .center)
                            .overlay(
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .bold())
                            .cornerRadius(15)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("No account ?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Button(action: {
                            self.isPresenter = true
                        })
                        {
                            Text("Sign Up")
                                .bold()
                                .font(.subheadline)
                        }
                        .sheet(isPresented: self.$isPresenter) {
                            RegistrationPageView(presentedBinding: self.$isPresenter)
                        }
                    }
                }
                .padding()
                .padding(.bottom)
                .padding(.bottom)
            }
            .navigationBarTitle("Login account")
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
