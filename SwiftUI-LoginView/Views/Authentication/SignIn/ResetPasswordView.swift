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
    
    @Binding var presentedBinding: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Image("reset")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 350, alignment: .center)
                    .padding(.vertical)
                
                TextFieldView(string: $email,
                              header: "",
                              placeholder: "Enter your email",
                              iconName: "envelope.fill")
                    .padding(.vertical)
                    
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
                    Alert(title: Text("Error!"),
                          message: Text(self.errorMessage!),
                          dismissButton: .destructive(Text("OK")))
                }
                .padding(.vertical)
            }
            .padding(.horizontal, 30)
            
            .navigationBarTitle("Forgot password ?")
            .navigationBarItems(trailing: Button("Cancel") {
                self.presentedBinding = false
            })
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    @State static var presentedBinding = false
    static var previews: some View {
        ResetPasswordView(presentedBinding: $presentedBinding)
    }
}
