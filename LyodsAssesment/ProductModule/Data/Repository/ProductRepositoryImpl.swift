//
//  UserRepositoryImpl.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

class ProductRepositoryImpl: IProductRepository {
    
    private let service: IProductService
    
    init(service: IProductService) {
        self.service = service
    }
    
    func makeServiceCallToGetProducts() -> ProductResponse {
        return service.makeNetworkRequest()
    }
    
}
