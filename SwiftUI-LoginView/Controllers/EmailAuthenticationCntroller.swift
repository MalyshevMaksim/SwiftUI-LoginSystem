//
//  FirebaseSession.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 19.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase

class EmailAuthenticationCntroller: ObservableObject {
    
    @Published var session: User?
    @Published var isLogin: Bool?
    
    func login(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func createAccount(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        
    }
}
