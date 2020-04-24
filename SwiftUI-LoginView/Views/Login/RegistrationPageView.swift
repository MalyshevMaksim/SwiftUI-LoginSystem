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
    @EnvironmentObject var session: EmailAuthenticationCntroller
    @State private var xOffset: CGFloat = 0
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("asset2")
                    .resizable()
                    .frame(width: 330, height: 230, alignment: .center)
                    .padding()
                
                VStack {
                    TextFieldView(string: $email, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 25)
                    TextFieldView(string: $password, passwordMode: true, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 25)
                    TextFieldView(string: $confirmPassword, passwordMode: true, header: "Confirm password", placeholder: "Confirm your password", iconName: "repeat")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 25)
                }
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
                    Button(action: {
                        self.session.createAccount(email: self.email, password: self.password) { (result, error) in
                            if error != nil {
                                print("Error!")
                            }
                            else {
                               //  var dbReference = Database.database().reference()
                            }
                        }
                    }) {
                        Rectangle()
                            .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                            .frame(width: 320, height: 50, alignment: .center)
                            .overlay(
                                Text("Continue")
                                .foregroundColor(.white)
                                .bold())
                            .cornerRadius(8)
                    }
                }
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
    static var previews: some View {
        RegistrationPageView(presentedBinding: $previewPresented)
    }
}
