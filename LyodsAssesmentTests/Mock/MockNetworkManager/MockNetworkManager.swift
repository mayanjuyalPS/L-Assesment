//
//  MockNetworkManager.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 01/07/22.
//

import Foundation
import PromiseKit

class MockNetworkManager: INetworkManager {
    
    var product: ProductResposne?
    
    func request<T>(_ type: T.Type, endPoint: INetworkRequest) -> Response where T : BaseCodable {
        return Promise { seal in
            if let product = product {
                seal.fulfill(product)
            } else {
                seal.reject(NSError(domain: "01", code: 1))
            }
        }
    }
    
}
