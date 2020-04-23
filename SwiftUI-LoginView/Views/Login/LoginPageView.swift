//
//  LoginPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginPageView: View {
    @ObservedObject var session = EmailAuthenticationCntroller()
    @State private var isPresenter = false
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextFieldView(string: $email, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                    TextFieldView(string: $password, passwordMode: true, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                }
                    
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                        
                        let change = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                    }
                }
                
                VStack(alignment: .trailing) {
                    Button(action: {
                        self.session.login(email: self.email, password: self.password) { (result, error) in
                            if error != nil {
                                print("Error!")
                            }
                            else {
                                print("Succesfull")
                            }
                        }
                    }) {
                        Rectangle()
                            .fill(Color.init(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                            .frame(width: 320, height: 50, alignment: .center)
                            .overlay(
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .bold())
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("No account ?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Button(action: {
                            self.isPresenter = true
                        })
                        {
                            Text("Sign Up")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                                .bold()
                                .font(.subheadline)
                        }
                        .sheet(isPresented: self.$isPresenter) {
                            RegistrationPageView(presentedBinding: self.$isPresenter)
                        }
                    }
                }
                    
                Spacer()
                FooterView()
                .padding(.bottom)
                .padding(.bottom)
            }
            .navigationBarTitle("Login account")
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
