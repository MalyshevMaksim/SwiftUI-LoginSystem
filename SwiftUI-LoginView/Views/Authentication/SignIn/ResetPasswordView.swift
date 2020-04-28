//
//  ResetPasswordView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 28.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase

struct ResetPasswordView: View {
    @State private var email = ""
    @State private var isShowingAlert = false
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            TextFieldView(string: $email,
                          header: "",
                          placeholder: "Enter your email",
                          iconName: "envelope.fill")
            Spacer()
                
            FillButton(text: "Reset", action: {
                
                // Вызываем метод Firebase для восстанавления пароля по email
                Auth.auth().sendPasswordReset(withEmail: self.email) { error in
                    if error != nil {
                        self.errorMessage = error?.localizedDescription
                        self.isShowingAlert = true
                    }
                }
            })
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Error!"), message: Text(self.errorMessage!), dismissButton: .destructive(Text("OK")))
            }
            .padding(.bottom)
        }
        .padding(.horizontal, 30)
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
