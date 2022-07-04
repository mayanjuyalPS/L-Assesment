//
//  IUserViewModel.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 30/06/22.
//

import Foundation

protocol IProductViewModel {
    var products: [Product] { get }
    func fetchProducts()
    var outputDelegate: ProductViewModelOutput? { get set }
}
