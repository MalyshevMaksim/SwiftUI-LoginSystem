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
    @Published var isLogin: Bool?
    @Published var session: User?
    
    func initSession() {
        session = Auth.auth().currentUser
        if session != nil && session!.isEmailVerified {
            withAnimation {
                self.isLogin = true
            }
        }
        else {
            withAnimation {
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
        
        withAnimation {
            self.isLogin = false
        }
    }
}
