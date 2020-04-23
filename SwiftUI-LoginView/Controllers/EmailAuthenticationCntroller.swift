//
//  FirebaseSession.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 19.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import Firebase
import SwiftUI

class EmailAuthenticationCntroller: ObservableObject {
    @Published var session: UserModel?
    @Published var isLogin: Bool = false
    
    func listener() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.session = UserModel(id: user?.uid, email: user?.email, name: user?.displayName)
                self.isLogin = true
            }
            else {
                self.session = nil
                self.isLogin = false
            }
        }
    }
    
    func login(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func createAccount(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func logout() {
        try! Auth.auth().signOut()
    }
}
