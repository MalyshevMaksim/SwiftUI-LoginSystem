//
//  Successful.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 28.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct Successful: View {
    @Binding var presentedBinding: Bool
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            VStack {
                Image("asset3")
                    .resizable()
                    .scaledToFit()
                Text("Successful")
                    .font(.title)
                    .bold()
                Text("Password recovery instructions have been sent to your email.")
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            FillButton(text: "Continue") {
                self.presentedBinding = false
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
        }
    }
}

struct Successful_Previews: PreviewProvider {
    @State static var bool = true
    static var previews: some View {
        Successful(presentedBinding: $bool)
    }
}
