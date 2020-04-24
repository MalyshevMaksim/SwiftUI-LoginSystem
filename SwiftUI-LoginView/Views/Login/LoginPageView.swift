//
//  LoginPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginPageView: View {
    @ObservedObject var session = EmailAuthenticationCntroller()
    @State private var isPresenter = false
    @State private var xOffset: CGFloat = 0
    
    @State private var errorMesssage: String?
    @State private var showingAlert = false
    
    @State private var email = ""
    @State private var password = ""
    
    func login() {
         Auth.auth().signIn(withEmail: self.email, password: self.password) { user, error in
            if error != nil {
                self.errorMesssage = error?.localizedDescription
                self.showingAlert = true
            }
         }
     }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("asset1")
                    .resizable()
                    .frame(width: 330, height: 230, alignment: .center)
                    .scaledToFill()
                VStack {
                    TextFieldView(string: $email, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 25)
                    TextFieldView(string: $password, passwordMode: true, header: "Password", placeholder: "Enter your password", iconName: "lock.open.fill")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 25)
                }
                    
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                        
                        let change = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        self.xOffset += change.height / 4
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                        self.xOffset = 0
                    }
                }
                
                VStack(alignment: .trailing) {
                    Button(action: { self.login() })
                    {
                        Rectangle()
                            .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                            .frame(width: 320, height: 50, alignment: .center)
                            .overlay(
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .bold())
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Error"), message: Text(self.errorMesssage!), dismissButton: .destructive(Text("OK")))
                    }
                    .padding(.bottom, 3)
                    
                    HStack {
                        Text("No account ?")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Button(action: {
                            self.isPresenter = true
                        })
                        {
                            Text("Sign Up")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                                .bold()
                                .font(.footnote)
                        }
                        .sheet(isPresented: self.$isPresenter) {
                            RegistrationPageView(presentedBinding: self.$isPresenter)
                        }
                    }
                }
                .padding(.vertical, 25)
                    
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
