//
//  LoginTextFields.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 26.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginTextFields: View {
    @Binding var bindEmail: String
    @Binding var bindPassword: String
    @Binding var bindOffset: CGFloat
    
    @State private var isShowingResetPage = false
    
    var body: some View {
         VStack {
            TextFieldView(string: self.$bindEmail,
                header: "Email",
                placeholder: "Enter your email",
                iconName: "envelope.fill")
            .padding(.vertical, 8)
                
            VStack(alignment: .trailing) {
                TextFieldView(string: self.$bindPassword,
                    passwordMode: true,
                    header: "Password",
                    placeholder: "Enter your password",
                    iconName: "lock.open.fill")
                    
                TextButton(text: "Forgot your password?", action: {
                    self.isShowingResetPage = true
                })
                .sheet(isPresented: $isShowingResetPage) {
                    ResetView(presentedBinding: self.$isShowingResetPage)
                }
            }
            .padding(.vertical, 8)
        }
    }
}

struct LoginTextFields_Previews: PreviewProvider {
    @State static var email = ""
    @State static var password = ""
    @State static var offset: CGFloat = 1

    static var previews: some View {
        LoginTextFields(bindEmail: $email, bindPassword: $password, bindOffset: $offset)
    }
}
