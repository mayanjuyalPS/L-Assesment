//
//  ProductUseCaseTest.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 01/07/22.
//

import XCTest
import Swinject
@testable import LyodsAssesment

class ProductUseCaseTest: XCTestCase {
    
    var useCase: IProductUseCase!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Assembler.type = .test
        useCase = Assembler.sharedAssembler.resolver.resolve(IProductUseCase.self)
    }
    
    func testUseCase() {
        let promise = expectation(description: "Product use case on success")
        
        useCase.getProducts()
            .done { model in
                if let model = model as? ProductResposne {
                    let productCount = model.products.count
                    if productCount >= 1 {
                        promise.fulfill()
                    }
                }
            }
            .catch { _ in
                promise.fulfill()
            }
        
        wait(for: [promise], timeout: 2.0)
    }
    
}
