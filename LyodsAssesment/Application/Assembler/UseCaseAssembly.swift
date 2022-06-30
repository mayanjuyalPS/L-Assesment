//
//  UseCaseAssembly.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import Swinject


class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(IProductUseCase.self) { r in
            return UserUseCaseImpl(repository: r.resolve(IProductRepository.self)!)
        }.inObjectScope(.transient)
    }
}
