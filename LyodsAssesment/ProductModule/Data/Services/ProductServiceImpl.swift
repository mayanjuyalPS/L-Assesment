//
//  UserService.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

class ProductServiceImpl: IProductService {
    
    private let network: INetworkManager
    
    init(network: INetworkManager) {
        self.network = network
    }
    
    func makeNetworkRequest() -> ProductResponse {
        let endPoint = NetworkRequest(path: ProductAPIEndpoints.productsEndPoint, method: .get)
        let promise = network.request(ProductDTO.self, endPoint: endPoint)
        return promise
    }
    
}
