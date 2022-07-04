//
//  DIContainer.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 04/07/22.
//

import Foundation
import UIKit

class ProductModule {
    
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func createProductViewController() -> UIViewController {
        let viewController = ProductViewController.initialize(on: .main)
        viewController.viewModel = createProductViewModel()
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
    
    private func createProductViewModel() -> IProductViewModel {
        let viewModel = ProductViewModelImpl(useCase: createProductUseCase())
        return viewModel
    }
    
    private func createProductUseCase() -> IProductUseCase {
        let useCase = ProductUseCaseImpl(repository: createProductRepository())
        return useCase
    }
    
    private func createProductRepository() -> IProductRepository {
        let repository = ProductRepositoryImpl(service: createProductService())
        return repository
    }
    
    private func createProductService() -> IProductService {
        let service = ProductServiceImpl(network: networkManager)
        return service
    }
    
}
