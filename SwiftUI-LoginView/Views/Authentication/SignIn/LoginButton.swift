//
//  LoginButtons.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 26.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginButtons: View {
    @ObservedObject var session: EmailAuthenticationCntroller
    
    @Binding var bindEmail: String
    @Binding var bindPassword:String
    
    @State private var errorMesssage: String?
    @State private var showingAlert = false
    @State private var showingSignUpPage = false
    
    @State private var alert: alertState = .standartMessage
    
    enum alertState {
        case standartMessage
        case verifivationError
    }
    
    fileprivate func login() {
       session.login(email: bindEmail, password: bindPassword) { user, error in
            if error != nil {
                self.errorMesssage = error?.localizedDescription
                self.alert = .standartMessage
                self.showingAlert = true
                return
            }
        
            if !Auth.auth().currentUser!.isEmailVerified {
                self.errorMesssage = "Your account has been created but not verified. Confirm registration by your email."
                self.alert = .verifivationError
                self.showingAlert = true
                return
            }
            
            UIApplication.shared.endEditing()
            self.session.initSession()
        }
    }
    
    fileprivate func createButton() -> some View {
        return TextButton(text: "Sign Up", action: {
            self.showingSignUpPage = true
        })
        .sheet(isPresented: self.$showingSignUpPage) {
            RegistrationPageView(presentedBinding: self.$showingSignUpPage, session: self.session)
        }
    }
    
    fileprivate func createSignInButton() -> some View {
        return FillButton(text: "Sign In", action: {
            self.login()
        })
        .alert(isPresented: $showingAlert) {
            if alert == alertState.verifivationError {
                return Alert(title: Text("Error!"),
                      message: Text(errorMesssage!),
                      primaryButton: .cancel(),
                      secondaryButton: .default(Text("Send email again"), action: {
                            Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                      })
                )
            }
            else {
                return Alert(title: Text("Error!"),
                message: Text(errorMesssage!),
                dismissButton: .destructive(Text("OK")))
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            createSignInButton()
            HStack {
                Text("No account?")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                createButton()
            }
        }
    }
}

struct LoginButtons_Previews: PreviewProvider {
    @State static var email = ""
    @State static var password = ""
    @ObservedObject static var session = EmailAuthenticationCntroller()
    static var previews: some View {
        LoginButtons(session: session, bindEmail: $email, bindPassword: $password)
    }
}
