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
                        
                })
            }
            .padding(.vertical, 8)
        }

        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                
                let change = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                self.bindOffset += change.height / 4
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                
                self.bindOffset = 0
            }
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