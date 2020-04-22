//
//  RegistrationView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 21.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct RegistrationPageView: View {
    @Binding var presentedBinding: Bool
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State var presentedBinding2 = false
    
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
                        .padding(.vertical, 20)
                        .padding(.horizontal, 25)
                    TextFieldView(string: $password, passwordMode: true, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 25)
                    TextFieldView(string: $confirmPassword, passwordMode: true, header: "Confirm password", placeholder: "Confirm your password", iconName: "repeat")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 25)
                }
                .padding(.bottom, 30)
                Spacer()
                
                VStack {
                    NavigationLink(destination: Text("123"), isActive: self.$presentedBinding2) {
                        Button(action: {
                            session.createAccount(email: self.email, password: self.password) { (result, error) in
                                if error != nil {
                                    self.presentedBinding2 = true
                                    print("Error!")
                                }
                                else {
                                    print("Successful!")
                                }
                            }
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
            }
            .navigationBarTitle("Create account")
            .navigationBarItems(trailing: Button("Cancel") {
                self.presentedBinding = false
            })
        }
        .padding(.bottom)
        .padding(.bottom)
    }
}

struct RegistrationPageView_Previews: PreviewProvider {
    @State static var previewPresented = false
    static var previews: some View {
        RegistrationPageView(presentedBinding: $previewPresented)
    }
}
