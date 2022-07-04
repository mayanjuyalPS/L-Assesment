//
//  MockServiceTest.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import PromiseKit

class MockServiceTest: IProductService {
    
    var products: ProductDTO?
    var error: Error?
    
    func makeNetworkRequest() -> ProductResponse {
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
