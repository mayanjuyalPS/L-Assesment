//
//  ControllerInstanceUtility.swift
//  ASOS
//
//  Created by Mayank Juyal on 30/05/22.
//

import Foundation
import UIKit

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
