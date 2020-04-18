//
//  TextFieldView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 18.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var string: String
    var header: String
    var placeholder: String
    var iconName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header.uppercased())
                .font(.footnote)
                .foregroundColor(.gray)
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                TextField(placeholder, text: $string, onEditingChanged: { flag in
                    
                })
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var myCoolBool = ""
    static var previews: some View {
        TextFieldView(string: $myCoolBool, header: "Email", placeholder: "Enter your email", iconName: "envelope.fill")
    }
}
