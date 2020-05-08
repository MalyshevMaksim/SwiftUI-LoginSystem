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
                          placeholder: "Enter your name",
                          iconName: "folder")
                .padding(.vertical, 8)
            
            TextFieldView(string: $firstName,
                          placeholder: "Enter your last name",
                          iconName: "folder")
                .padding(.vertical, 8)
            
            Spacer()
            Button(action: {  }) {
                Rectangle()
                    .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                    .frame(height: 50, alignment: .center)
                    .overlay(Text("Finish").foregroundColor(.white).bold())
                    .cornerRadius(8)
            }
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
