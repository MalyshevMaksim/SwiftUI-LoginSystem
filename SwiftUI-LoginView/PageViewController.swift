//
//  PageViewController.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 15.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
    
    // An array that provides the views to display as a page
    var viewControllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageController.delegate   = context.coordinator
        pageController.dataSource = context.coordinator
        return pageController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject {
    var parent: PageViewController
    
    init(_ parent: PageViewController) {
        self.parent = parent
    }
}

extension Coordinator: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let pageNumber = parent.viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        if pageNumber == 0 {
            return parent.viewControllers.last
        }
        return parent.viewControllers[pageNumber - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let pageNumber = parent.viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        if pageNumber + 1 == parent.viewControllers.count {
            return parent.viewControllers.first
        }
        return parent.viewControllers[pageNumber + 1]
    }
}

extension Coordinator: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return parent.viewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
