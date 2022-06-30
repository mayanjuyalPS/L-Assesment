//
//  Alertable.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import UIKit

protocol Alertable {
    func showAlert(title: String?, message: String?, on controller: UIViewController)
}

extension Alertable {
    func showAlert(title: String? = nil, message: String?, on controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        controller.present(alert, animated: true)
    }
}
