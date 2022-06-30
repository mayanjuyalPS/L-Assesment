//
//  UserViewModel.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import Combine

class ProductViewModelImpl: IProductViewModel {
    
    var products: [Product] = []
    
    private let useCase: IProductUseCase
    var status: CurrentValueSubject<APIStatus, Never> = .init(.none)
    
    func fetchProducts() {
        status.send(.loading)
        useCase.getProducts()
            .done(on: .main) { [weak self] model in
                print("Success ===> ", model)
                self?.getData(model: model)
            }
            .catch(on: .main, policy: .allErrors) { [weak self] error in
                print("Error ===> ", error.localizedDescription)
                self?.status.send(.failed(error.localizedDescription))
            }
    }
    
    private func getData(model: BaseCodable) {
        if let model = model as? ProductResposne {
            products = model.products
            status.send(.success)
        }
    }
    
    init(useCase: IProductUseCase) {
        self.useCase = useCase
    }
    
}
