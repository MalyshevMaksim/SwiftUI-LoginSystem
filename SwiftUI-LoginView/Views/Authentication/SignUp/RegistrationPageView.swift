//
//  RegistrationView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 21.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase

struct RegistrationPageView: View {
    @ObservedObject var session: SessionCntroller
    @Binding var presentedBinding: Bool
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var errorMessage: String?
    @State private var presentedAlert = false
    
    fileprivate func registration() {
        if password != confirmPassword {
            self.errorMessage = "Password mismatch!"
            self.presentedAlert = true
            return
        }
        
        // Attempt to create account
        session.createAccount(email: email, password: password) { user, error in
            // If an error occurred while logging into the system, then display its message in alert
            if error != nil {
                self.errorMessage = error?.localizedDescription
                self.presentedAlert = true
                return
            }
            
            // Send an email to confirm the user
            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                
            })
            
            UIApplication.shared.endEditing()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("asset2")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                VStack {
                   TextFieldView(string: $email,
                                 passwordMode: false,
                                 placeholder: "Enter your email",
                                 iconName: "envelope.fill")
                        .padding(.vertical, 8)
                    
                    TextFieldView(string: $password,
                                  passwordMode: true,
                                  placeholder: "Enter your password",
                                  iconName: "lock.open.fill")
                        .padding(.vertical, 8)
                    
                    TextFieldView(string: $confirmPassword,
                                  passwordMode: true,
                                  placeholder: "Confirm your password",
                                  iconName: "repeat")
                        .padding(.vertical, 8)
                }
                .padding(.vertical)
                
                Button(action: { self.registration() })
                {
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        .frame(height: 50, alignment: .center)
                        .overlay(Text("Continue").foregroundColor(.white).bold())
                        .cornerRadius(8)
                }
                .alert(isPresented: $presentedAlert) {
                    Alert(title: Text("Error!"), message: Text(self.errorMessage!), dismissButton: .destructive(Text("OK")))
                }
            }
            .keyboardAdaptive()
            .padding(.horizontal, 30)
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
    @ObservedObject static var session = SessionCntroller()
    static var previews: some View {
        RegistrationPageView(session: SessionCntroller(), presentedBinding: $previewPresented)
    }
}
