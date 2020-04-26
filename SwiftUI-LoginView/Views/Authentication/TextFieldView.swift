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
    
    var passwordMode = false
    var header: String
    var placeholder: String
    var iconName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.6156862745, green: 0.6431372549, blue: 0.6941176471, alpha: 1)))
                    .padding(.vertical, 20)
                    .padding(.trailing, 5)
                    .padding(.leading, 20)
                
                if passwordMode {
                    SecureField(placeholder, text: $string)
                }
                else {
                    TextField(placeholder, text: $string, onEditingChanged: { flag in
                        
                    })
                }
                
                if passwordMode {
                    Button(action: {
                        
                    })
                    {
                        Image(systemName: "eye")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                            .padding()
                    }
                }
            }
        }
            
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.init(#colorLiteral(red: 0.9568627451, green: 0.9647058824, blue: 0.9764705882, alpha: 1))))
    }
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var myCoolBool = ""
    static var previews: some View {
        TextFieldView(string: $myCoolBool, header: "Email", placeholder: "Please enter your email", iconName: "envelope.fill")
    }
}
