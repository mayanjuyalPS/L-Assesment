//
//  MockServiceTest.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import PromiseKit

class MockServiceTest: IProductService {
    
    let product: ProductResposne? = ProductResposne(limit: 1, total: 1,
                                  products: [Product(title: "ABC",
                                                     description: "QWERRTTYY",
                                                     price: 10,
                                                     thumbnail: "")])
    
    
    func makeNetworkRequest() -> Response {
        return Promise { seal in
            if let product = product {
                seal.fulfill(product)
            } else {
                seal.reject(NSError(domain: "01", code: 1))
            }
        }
    }
}
