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
    // The states depending on which a specific alert will be shown
    enum alertState {
        case standartError
        case verifivationError
    }
    
    @Binding var bindEmail: String
    @Binding var bindPassword:String
    
    @State private var errorMesssage: String?
    @State private var presentedAlert = false
    @State private var presentedSignUpPage = false
    
    @State private var alert: alertState = .standartError
    
    fileprivate func login() {
       // Attempt to login
       session.login(email: bindEmail, password: bindPassword) { user, error in
            if error != nil {
                // If an error occurred while logging into the system, then display its message in alert
                self.errorMesssage = error?.localizedDescription
                self.alert = .standartError
                self.presentedAlert = true
                return
            }
        
            /* If the user correctly entered their data, but has not yet been verified,
               then we display the corresponding message */
            if !Auth.auth().currentUser!.isEmailVerified {
                self.errorMesssage = "Your account has been created but not verified. Confirm registration by your email."
                
                // Change the state of Alert with the ability to send letters
                self.alert = .verifivationError
                self.presentedAlert = true
                return
            }
            
            // If the user has been verified, then initialize the session object
            UIApplication.shared.endEditing()
            session.initialSession()
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button(action: { self.login() }) {
                Rectangle()
                    .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                    .frame(height: 50, alignment: .center)
                    .overlay(Text("Sign In").foregroundColor(.white).bold())
                    .cornerRadius(8)
            }
            .alert(isPresented: $presentedAlert) {
                if alert == alertState.verifivationError {
                    return Alert(title: Text("Error!"),
                          message: Text(errorMesssage!),
                          primaryButton: .cancel(),
                          secondaryButton: .default(Text("Send email again"), action: {
                                // Resend verification email
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
            
            HStack {
                Text("No account?")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Button(action: { self.presentedSignUpPage = true }) {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                        .bold()
                        .font(.footnote)
                }
                .sheet(isPresented: self.$presentedSignUpPage) {
                    RegistrationPageView(presentedBinding: self.$presentedSignUpPage)
                }
            }
        }
    }
}

struct LoginButtons_Previews: PreviewProvider {
    @State static var email = ""
    @State static var password = ""
    static var previews: some View {
        LoginButtons(bindEmail: $email, bindPassword: $password)
    }
}
