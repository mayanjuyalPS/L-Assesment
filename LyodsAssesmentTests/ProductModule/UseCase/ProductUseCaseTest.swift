//
//  ProductUseCaseTest.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 01/07/22.
//

import XCTest
@testable import LyodsAssesment


class ProductUseCaseTest: XCTestCase {
    
    struct ErrorMessage {
        static let kFailedErrorMeesage = "Use Case Failed Error"
    }
    
    var useCase: IProductUseCase!
    let repository = MockRepository()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        useCase = ProductUseCaseImpl(repository: repository)
    }
    
    func testUseCase_Success() {
        let promise = expectation(description: "Product use case on success")
        
        repository.products = MockData.product
        
        useCase.getProducts()
            .done { model in
                if let model = model as? ProductResponse {
                    let productCount = model.products.count
                    if productCount >= 1 {
                        promise.fulfill()
                    }
                }
            }
            .catch { _ in }
        
        wait(for: [promise], timeout: 2.0)
    }
    
    func testUseCase_Failure() {
        let promise = expectation(description: "Product use case on failed")
        repository.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kFailedErrorMeesage])
        
        useCase.getProducts()
            .catch { error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kFailedErrorMeesage)
                promise.fulfill()
            }
        
        wait(for: [promise], timeout: 2.0)
    }
    
}
