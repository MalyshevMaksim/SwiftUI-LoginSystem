//
//  MainPageView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 24.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct MainPageView: View {
    @ObservedObject var session: EmailAuthenticationCntroller
    @State private var isPagePresented = false
    
    var customTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
        return transition
    }
    
    var body: some View {
        ZStack {
            if isPagePresented {
                VStack {
                    Spacer()
                    VStack {
                        Image("Billie")
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
                            Text(session.user?.email ?? "")
                                .font(.callout)
                        }
                    }
                    
                    Spacer()
                    Button(action: {
                        self.session.logout()
                    })
                    {
                        Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                        .frame(width: 320, height: 50, alignment: .center)
                        .overlay(
                            Text("Log Out")
                                .foregroundColor(.white)
                                .bold())
                        .cornerRadius(8)
                    }
                    .padding()
                }
                .animation(.spring())
                .transition(customTransition)
            }
        }
        .onAppear {
            self.isPagePresented = true
        }
    }
}

//struct MainPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPageView()
//    }
//}
