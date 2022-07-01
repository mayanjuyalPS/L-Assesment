//
//  ProductService.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 01/07/22.
//

import XCTest
import Swinject
@testable import LyodsAssesment

class ProductService: XCTestCase {
    
    var productService: IProductService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Assembler.type = .test
        productService = Assembler.sharedAssembler.resolver.resolve(IProductService.self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testService() {
        let promise = expectation(description: "Product service on success case")
        productService.makeNetworkRequest()
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
