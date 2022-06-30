//
//  RepositoryAssembly.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import Swinject


class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(IProductRepository.self) { r in
            return ProductRepositoryImpl(service: r.resolve(IProductService.self)!)
        }.inObjectScope(.transient)
    }
}
