//
//  ProductRepository.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 01/07/22.
//

import XCTest

@testable import LyodsAssesment

class ProductRepository: XCTestCase {
    
    struct ErrorMessage {
        static let kFailedErrorMeesage = "Repository Failed Error"
    }
    
    var productRepository: IProductRepository!
    let mockService = MockServiceTest()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        productRepository = ProductRepositoryImpl(service: mockService)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRepository_Success() {
        let promise = expectation(description: "Product Repository on success")
        
        mockService.products = MockData.product
        
        productRepository.makeServiceCallToGetProducts()
            .done { model in
                if let model = model as? ProductResponse {
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
    
    func testRepository_Failure() {
        let promise = expectation(description: "Product Repository on Failed")
        
        mockService.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kFailedErrorMeesage])
        
        productRepository.makeServiceCallToGetProducts()
            .catch {error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kFailedErrorMeesage)
                promise.fulfill()
            }
        
        wait(for: [promise], timeout: 2.0)
    }
    
}
