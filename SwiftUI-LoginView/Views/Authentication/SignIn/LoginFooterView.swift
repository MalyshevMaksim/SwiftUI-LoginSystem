//
//  FooterView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 23.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginFooterView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 0.5)
                Text("OR")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 0.5)
            }
            .padding(.vertical, 5)
            
            HStack {
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                        HStack {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22, alignment: .center)
                            Text("Google")
                                .font(.caption)
                                .bold()
                        }
                    }
                }
                .frame(height: 45, alignment: .center)
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                        HStack {
                            Image("apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22, alignment: .center)
                            Text("Apple")
                                .font(.caption)
                                .bold()
                        }
                    }
                }
                .frame(height: 45, alignment: .center)
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct LoginFooterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFooterView()
    }
}
