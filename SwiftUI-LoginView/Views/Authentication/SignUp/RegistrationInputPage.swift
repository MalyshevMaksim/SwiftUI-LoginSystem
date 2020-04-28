//
//  RegistrationInputPage.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 28.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct RegistrationInputPage: View {
    @State private var firstName = ""
    @State private var lastName  = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Button(action: {
                
            })
            {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
            }
            .padding()
            
            TextFieldView(string: $firstName,
                          header: "Enter your name",
                          placeholder: "Enter your name",
                          iconName: "folder")
                .padding(.vertical, 8)
            
            TextFieldView(string: $firstName,
                          header: "Enter your first name",
                          placeholder: "Enter your last name",
                          iconName: "folder")
                .padding(.vertical, 8)
            
            Spacer()
            FillButton(text: "Finish", action: {
                
            })
        }
        .padding(.bottom)
        .padding(.horizontal, 30)
    }
}

struct RegistrationInputPage_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationInputPage()
    }
}
