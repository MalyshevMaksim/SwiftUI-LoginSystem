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
    @Binding var presentedBinding: Bool
    @ObservedObject var session: EmailAuthenticationCntroller
    @State private var offset: CGFloat = 0
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var errorMessage: String?
    @State private var showingAlert = false
    
    func registration() {
        if password != confirmPassword {
            self.errorMessage = "Password mismatch!"
            self.showingAlert = true
            return
        }
        session.createAccount(email: email, password: password) { user, error in
            if error != nil {
                self.errorMessage = error?.localizedDescription
                self.showingAlert = true
                return
            }
            
            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                
            })
            
            UIApplication.shared.endEditing()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if offset == 0 {
                    Image("asset2")
                        .resizable()
                        .scaledToFit()
                }
                
                Spacer()
                
                VStack {
                   TextFieldView(string: $email,
                                 passwordMode: false,
                                 placeholder: "Enter your email",
                                 iconName: "envelope.fill",
                                 onEditingChanged: { flag in
                                    withAnimation(.spring()) {
                                        self.offset = flag ? 210 : 0
                                    }
                                 })
                        .padding(.vertical, 8)
                    
                    TextFieldView(string: $password,
                                  passwordMode: true,
                                  placeholder: "Enter your password",
                                  iconName: "lock.open.fill",
                                  onEditingChanged: { flag in
                                    withAnimation(.spring()) {
                                        self.offset = flag ? 210 : 0
                                    }
                                  })
                        .padding(.vertical, 8)
                    
                    TextFieldView(string: $confirmPassword,
                                  passwordMode: true,
                                  placeholder: "Confirm your password",
                                  iconName: "repeat",
                                  onEditingChanged: { flag in
                                    withAnimation(.spring()) {
                                        self.offset = flag ? 210 : 0
                                    }
                                  })
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
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error!"), message: Text(self.errorMessage!), dismissButton: .destructive(Text("OK")))
                }
            }
            .offset(y: -offset)
            .padding(.horizontal, 30)
            .navigationBarTitle(offset == 0 ? "Create account" : "")
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
    @ObservedObject static var session = EmailAuthenticationCntroller()
    static var previews: some View {
        RegistrationPageView(presentedBinding: $previewPresented, session: self.session)
    }
}
