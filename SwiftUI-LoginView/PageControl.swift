//
//  PageControl.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPage: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPage
        pageControl.backgroundColor = UIColor.clear
        pageControl.pageIndicatorTintColor = UIColor.systemGray3
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var parent: PageControl
        
        init(_ parent: PageControl) {
            self.parent = parent
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
    }
}
