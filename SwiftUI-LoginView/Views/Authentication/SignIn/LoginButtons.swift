//
//  LoginButtons.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 26.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginButtons: View {
    @ObservedObject var session: EmailAuthenticationCntroller
    
    @Binding var bindEmail: String
    @Binding var bindPassword:String
    
    @State private var errorMesssage: String?
    @State private var showingAlert = false
    
    func login() {
       session.login(email: bindEmail, password: bindPassword) { user, error in
           if error != nil {
               self.errorMesssage = error?.localizedDescription
               self.showingAlert = true
           }
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            FillButton(text: "Sign In", action: {
                self.login()
            })
            .alert(isPresented: $showingAlert) {
                Alert(title:Text("Error!"),
                    message: Text(self.errorMesssage!),
                    dismissButton: .destructive(Text("OK")))
            }
            
            HStack {
                Text("No account?")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                TextButton(text: "Sign Up", action: {
                    
                })
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
