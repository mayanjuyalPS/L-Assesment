//
//  UserUseCaseImpl.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

class UserUseCaseImpl: IProductUseCase {
    
    private let repository: IProductRepository
    
    init(repository: IProductRepository) {
        self.repository = repository
    }
    
    func getProducts() -> Response {
        return repository.makeServiceCallToGetProducts()
    }
}
