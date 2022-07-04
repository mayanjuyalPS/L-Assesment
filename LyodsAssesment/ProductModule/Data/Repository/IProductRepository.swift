//
//  IUserRepository.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

protocol IProductRepository {
    func makeServiceCallToGetProducts() -> ProductResponse
}
