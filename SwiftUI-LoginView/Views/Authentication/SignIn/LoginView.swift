//
//  LoginPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @ObservedObject var session: EmailAuthenticationCntroller
    @State private var offset: CGFloat = 0
    @State private var email = ""
    @State private var password = ""
    @State private var presentedPasswordReset = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Login to account")
                .bold()
                .font(.largeTitle)
                .padding(.horizontal, 30)
                .padding(.top)
            
            Spacer()
            
            VStack(alignment: .center) {
                if offset == 0 {
                    Image("asset1")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                
                VStack {
                    TextFieldView(string: self.$email,
                        passwordMode: false,
                        placeholder: "Enter your email",
                        iconName: "envelope.fill",
                        onEditingChanged:  { flag in
                            self.offset = flag ? 170 : 0
                        })
                        .padding(.vertical, 8)
                        
                    VStack(alignment: .trailing) {
                        TextFieldView(string: self.$password,
                            passwordMode: true,
                            placeholder: "Enter your password",
                            iconName: "lock.open.fill",
                            onEditingChanged:  { flag in
                                self.offset = flag ? 170 : 0
                            })
                        
                        Button(action: { self.presentedPasswordReset = true }) {
                            Text("Forgot password?")
                                .foregroundColor(Color.blue)
                                .bold()
                                .font(.footnote)
                        }
                        .sheet(isPresented: $presentedPasswordReset) {
                            ResetView(presentedBinding: self.$presentedPasswordReset)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                LoginButtons(session: session,
                    bindEmail: $email,
                    bindPassword: $password)
            }
            .offset(y: -offset)
            .padding(.bottom)
            .padding(.horizontal, 30)
            
            LoginFooterView()
                .padding(.horizontal, 20)
                .padding(.bottom)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @ObservedObject static var session = EmailAuthenticationCntroller()
    static var previews: some View {
        LoginView(session: session)
    }
}
