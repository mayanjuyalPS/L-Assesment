//
//  UserService.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

protocol IProductService {
    func makeNetworkRequest() -> Response
}

class ProductServiceImpl: IProductService {
    
    func makeNetworkRequest() -> Response {
        let endPoint = NetworkRequest(path: UserEndpoints.productsEndPoint, method: .get)
        let promise = NetworkClient.request(ProductResposne.self, endPoint: endPoint)
        return promise
    }
    
}
