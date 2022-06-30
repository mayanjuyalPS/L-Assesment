//
//  IUserViewModel.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 30/06/22.
//

import Foundation
import Combine

enum APIStatus {
    case none, loading, success, failed(String)
}

protocol IProductViewModel {
    var status: CurrentValueSubject<APIStatus, Never> {get set}
    var products: [Product] { get }
    func fetchProducts()
}
