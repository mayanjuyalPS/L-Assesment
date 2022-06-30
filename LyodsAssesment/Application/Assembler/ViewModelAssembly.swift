//
//  ViewModelAssembly.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(IProductViewModel.self) { r in
            return ProductViewModelImpl(useCase: r.resolve(IProductUseCase.self)!)
        }.inObjectScope(.transient)
    }
}
