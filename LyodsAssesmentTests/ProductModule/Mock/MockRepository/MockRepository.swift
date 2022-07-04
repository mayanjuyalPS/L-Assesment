//
//  MockRepository.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 04/07/22.
//

import Foundation
import PromiseKit

class MockRepository: IProductRepository {
    
    var products: ProductResponse?
    var error: Error?
    
    func makeServiceCallToGetProducts() -> Response {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let product = products {
                    seal.fulfill(product)
                } else {
                    seal.reject(NSError(domain: "com.example.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
    
    
}
