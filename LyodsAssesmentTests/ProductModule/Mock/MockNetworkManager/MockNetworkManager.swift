//
//  MockNetworkManager.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 01/07/22.
//

import Foundation
import PromiseKit

class MockNetworkManager: INetworkManager {
    
    var products: ProductResponse?
    var error: Error?
    
    func request<T>(_ type: T.Type, endPoint: INetworkRequest) -> Response where T : BaseCodable {
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
