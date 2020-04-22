//
//  User.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 19.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

class UserModel {
    var id: String?
    var email: String?
    var name: String?
    
    init(id: String?, email: String?, name: String?) {
        self.id = id
        self.email = email
        self.name = name
    }
}
