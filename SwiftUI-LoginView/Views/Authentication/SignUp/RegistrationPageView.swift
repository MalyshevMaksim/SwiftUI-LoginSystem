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
    @State private var xOffset: CGFloat = 0
    
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
            
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                
            })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("asset2")
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    TextFieldView(string: $email,
                                  header: "Email",
                                  placeholder: "Enter your email",
                                  iconName: "envelope.fill")
                        .padding(.vertical, 8)
                    
                    TextFieldView(string: $password, passwordMode: true,
                                  header: "Password",
                                  placeholder: "Enter your password",
                                  iconName: "lock.open.fill")
                        .padding(.vertical, 8)
                    
                    TextFieldView(string: $confirmPassword, passwordMode: true,
                                  header: "Confirm password",
                                  placeholder: "Confirm your password",
                                  iconName: "repeat")
                        .padding(.vertical, 8)
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                    
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                        let change = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        self.xOffset += change.height / 2
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                        self.xOffset = 0
                    }
                }
                
                Spacer()
                
                VStack {
                    FillButton(text: "Continue", action: {
                        self.registration()
                    })
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Error!"), message: Text(self.errorMessage!), dismissButton: .destructive(Text("OK")))
                    }
                }
                .padding(.horizontal, 30)
            }
            .navigationBarTitle("Create account")
            .navigationBarItems(trailing: Button("Cancel") {
                self.presentedBinding = false
            })
        }
        .offset(y: -xOffset)
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
