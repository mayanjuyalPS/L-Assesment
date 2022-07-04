//
//  ProductService.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 01/07/22.
//

import XCTest

@testable import LyodsAssesment

class ProductService: XCTestCase {
    
    struct ErrorMessage {
        static let kFailedErrorMeesage = "Product Failed Error"
    }
    
    var productService: IProductService!
    let mockNetworkManager = MockNetworkManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        productService = ProductServiceImpl(network: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testService_Success() {
        let promise = expectation(description: "Product service on success case")
        mockNetworkManager.products = MockData.product
        productService.makeNetworkRequest()
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
    

    func testService_Error() {
        let promise = expectation(description: "Product service on success case")
        mockNetworkManager.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kFailedErrorMeesage])
        productService.makeNetworkRequest()
            .catch { _ in
                promise.fulfill()
            }
        wait(for: [promise], timeout: 2.0)
    }
    
}
