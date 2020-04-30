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
    
    @Binding var currentPage: resetPageState
    @Binding var presentedBinding: Bool
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Image("reset")
                        .resizable()
                        .scaledToFit()
                        .frame(height: geometry.size.height * 0.3, alignment: .center)
                    
                    VStack {
                        Text("Forgot Password?")
                            .bold()
                            .font(.title)
                            .padding(.vertical)
                        Text("Enter the email address associated with you account")
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.vertical)
                    
                    TextFieldView(string: self.$email,
                                  header: "",
                                  placeholder: "Enter email address",
                                  iconName: "envelope.fill")
                        .padding(.bottom)
                    
                    Spacer()
                        
                    FillButton(text: "Reset Password", action: {
                        
                        // Вызываем метод Firebase для восстанавления пароля по email
                        Auth.auth().sendPasswordReset(withEmail: self.email) { error in
                            if error != nil {
                                self.errorMessage = error?.localizedDescription
                                self.isShowingAlert = true
                                return
                            }
                            
                            self.currentPage = .successful
                        }
                    })
                        .alert(isPresented: self.$isShowingAlert) {
                        Alert(title: Text("Error!"),
                              message: Text(self.errorMessage!),
                              dismissButton: .destructive(Text("OK")))
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal, 30)
                
                .navigationBarItems(trailing: Button("Cancel") {
                    self.presentedBinding = false
                })
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    @State static var presentedBinding = false
    @State static var test: resetPageState = .successful
    static var previews: some View {
        ResetPasswordView(currentPage: $test, presentedBinding: $presentedBinding)
    }
}
