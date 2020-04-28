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
    @State private var showingVerificationAlert = false
    @State private var showingSignUpPage = false
    
    func login() {
       session.login(email: bindEmail, password: bindPassword) { user, error in
            if error != nil {
                self.errorMesssage = error?.localizedDescription
                self.showingAlert = true
                return
            }
        
            if !Auth.auth().currentUser!.isEmailVerified {
                self.errorMesssage = "Your account has been created but not verified. Confirm registration by your email."
                self.showingVerificationAlert = true
                return
            }
            
            self.session.isLogin = true
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            FillButton(text: "Sign In", action: {
                self.login()
            })
            .alert(isPresented: $showingVerificationAlert) {
                Alert(title: Text("Error"),
                      message: Text(errorMesssage!),
                      primaryButton: .cancel(),
                      secondaryButton: .default(Text("Send email again"), action: {
                            Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                      })
                )
            }
            
            HStack {
                Text("No account?")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                TextButton(text: "Sign Up", action: {
                    self.showingSignUpPage = true
                })
                .sheet(isPresented: self.$showingSignUpPage) {
                    RegistrationPageView(presentedBinding: self.$showingSignUpPage, session: self.session)
                }
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
