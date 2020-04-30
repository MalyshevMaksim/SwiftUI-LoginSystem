//
//  ResetView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 30.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

enum resetPageState {
    case reset
    case successful
}

struct ResetView: View {
    @Binding var presentedBinding: Bool
    @State private var currentPage: resetPageState = .reset
    
    var body: some View {
        containedView()
    }
    
    func containedView() -> AnyView {
        switch currentPage {
        case .reset:
            return AnyView(ResetPasswordView(currentPage: $currentPage, presentedBinding: $presentedBinding))
        case .successful:
            return AnyView(Successful(currentPage: $currentPage, presentedBinding: $presentedBinding))
        }
    }
}

struct ResetView_Previews: PreviewProvider {
    @State static var bool = true
    static var previews: some View {
        ResetView(presentedBinding: $bool)
    }
}
