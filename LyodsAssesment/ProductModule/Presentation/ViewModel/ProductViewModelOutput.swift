//
//  IProductViewModelOutput.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 04/07/22.
//

import Foundation

protocol ProductViewModelOutput {
    func success()
    func gotError(_ error: String)
}
