//
//  Successful.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 28.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct Successful: View {
    var body: some View {
        VStack {
            Text("Successful")
                .font(.title)
                .bold()
                .padding(.vertical)
            Image("asset3")
                .resizable()
                .scaledToFit()
            
            Text("Password recovery instructions have been sent to your email.")
                .foregroundColor(.secondary)
                .padding(.vertical)
                .padding(.horizontal, 30)
                .multilineTextAlignment(.center)
            
            FillButton(text: "Continue") {
                
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
        }
    }
}

struct Successful_Previews: PreviewProvider {
    static var previews: some View {
        Successful()
    }
}
