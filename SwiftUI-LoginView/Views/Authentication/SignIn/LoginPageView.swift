//
//  LoginPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import Firebase

func FillButton(text: String, action: @escaping () ->Void) -> some View {
    return Button(action: {
        action()
    })
    {
        Rectangle()
            .fill(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
            .frame(height: 50, alignment: .center)
            .overlay(Text(text).foregroundColor(.white).bold())
            .cornerRadius(8)
    }
}

func TextButton(text: String, action: @escaping () ->Void) -> some View {
    return Button(action: {
        action()
    })
    {
        Text(text)
            .foregroundColor(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
            .bold()
            .font(.footnote)
    }
}

struct LoginPageView: View {
    @ObservedObject var session = EmailAuthenticationCntroller()
    
    @State private var offset: CGFloat = 0
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Login to account")
                    .bold()
                    .font(.largeTitle)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 3)
                Text("Please enter your credentials")
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 30)
            }
            .padding(.top)
                    
            Spacer()
            
            VStack(alignment: .center) {
                Image("asset1")
                .resizable()
                .scaledToFit()
                
                LoginTextFields(bindEmail: $email,
                    bindPassword: $password,
                    bindOffset: $offset)
                .padding(.bottom)
                
                LoginButtons(session: session,
                    bindEmail: $email,
                    bindPassword: $password)
            }
            .padding(.bottom)
            .padding(.horizontal, 30)
            
            FooterView()
            .padding(.horizontal, 20)
            .padding(.bottom)
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
