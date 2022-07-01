//
//  MockServiceTest.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import PromiseKit

class MockServiceTest: IProductService {
    
    func makeNetworkRequest() -> Response {
        return Promise { seal in
            if let product = MockData.product {
                seal.fulfill(product)
            } else {
                seal.reject(NSError(domain: "01", code: 1))
            }
        }
    }
}
