//
//  ViewControllerAssesmbly.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import UIKit
import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        // Splash view controller initialization
        container.register(UserViewController.self) { r in
            let controller = UserViewController.initialize(on: .main)
            let viewModel = r.resolve(IProductViewModel.self)
            controller.viewModel = viewModel
            return controller
        }.inObjectScope(.transient)
    }
}



enum Storyboard: String {
    case main = "Main"
}

/**
 
 ViewController Utility where we can add another functionality for UIViewController
 
 */

protocol ViewControllerUtilities where Self: UIViewController {
    static func initialize(on storyboard: Storyboard) -> Self
}

extension ViewControllerUtilities {
    
    static func initialize(on storyboard: Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self else {
            fatalError("Could not find view controller with identifier \(String(describing: Self.self))")
        }
        return controller
    }
    
}

extension UIViewController: ViewControllerUtilities {}
