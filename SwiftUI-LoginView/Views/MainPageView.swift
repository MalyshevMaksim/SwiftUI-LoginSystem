//
//  MainPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 24.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct MainPageView: View {
    @ObservedObject var session: SessionCntroller
    @State private var presentedSignOutAlert = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                Image("google")
                    .resizable()
                    .frame(width: 170, height: 170, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                
                VStack {
                    Text("Email:")
                        .bold()
                        .font(.callout)
                    Text(session.session?.email ?? "Invalid")
                        .font(.callout)
                }
            }
            
            Spacer()
            Button(action: { self.presentedSignOutAlert = true }) {
                Rectangle()
                    .fill(Color.init(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                    .frame(width: 320, height: 50, alignment: .center)
                    .overlay(
                        Text("Log Out")
                            .foregroundColor(.white)
                            .bold())
                    .cornerRadius(8)
            }
            .actionSheet(isPresented: $presentedSignOutAlert) {
                ActionSheet(title: Text("Warning"),
                            message: Text("Are you sure you want to sign out?"),
                            buttons: [.cancel(),.destructive(Text("Sign out"),
                                                             action: { self.session.logout() })])
            }
            .padding()
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(session: SessionCntroller())
    }
}
