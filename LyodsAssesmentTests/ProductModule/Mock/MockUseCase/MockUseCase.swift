//
//  MockUseCase.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 04/07/22.
//

import Foundation
import PromiseKit

class MockUseCase: IProductUseCase {
    
    var products: ProductDTO?
    var error: Error?
    
    func getProducts() -> ProductResponse {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let product = products {
                    seal.fulfill(product)
                }
            }
        }
    }
    
}
