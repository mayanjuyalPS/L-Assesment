//
//  UserUseCaseImpl.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

class ProductUseCaseImpl: IProductUseCase {
    
    private let repository: IProductRepository
    
    init(repository: IProductRepository) {
        self.repository = repository
    }
    
    func getProducts() -> ProductResponse {
        return repository.makeServiceCallToGetProducts()
    }
}
