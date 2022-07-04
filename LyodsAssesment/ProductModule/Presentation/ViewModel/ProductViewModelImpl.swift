//
//  UserViewModel.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

class ProductViewModelImpl: IProductViewModel {
    
    var outputDelegate: ProductViewModelOutput?
    
    var products: [Product] = []
    
    private let useCase: IProductUseCase
    
    func fetchProducts() {
        useCase.getProducts()
            .done(on: .main) { [weak self] model in
                debugPrint("Success ===> ", model)
                self?.getData(model: model)
            }
            .catch(on: .main, policy: .allErrors) { [weak self] error in
                self?.outputDelegate?.gotError(error.localizedDescription)
            }
    }
    
    private func getData(model: ProductDTO) {
        products = model.products
        outputDelegate?.success()
    }
    
    init(useCase: IProductUseCase) {
        self.useCase = useCase
    }
    
}
