//
//  UserViewModelTest.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 29/06/22.
//

import XCTest

@testable import LyodsAssesment

class UserViewModelTest: XCTestCase {
    
    var userViewModel: IProductViewModel?
    var useCase = MockUseCase()
    private var promise: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        userViewModel = ProductViewModelImpl(useCase: useCase)
        userViewModel?.outputDelegate = self
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewModel_Success() {
        promise = expectation(description: "Should get success")
        useCase.products = MockData.product
        userViewModel?.fetchProducts()
        wait(for: [promise], timeout: 10.0)
    }
    
    func testViewModel_Fail() {
        promise = expectation(description: "Should get fail")
        useCase.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"])
        userViewModel?.fetchProducts()
        wait(for: [promise], timeout: 10.0)
    }
    
    
}

extension UserViewModelTest: ProductViewModelOutput {
    
    func success() {
        promise.fulfill()
    }
    
    func gotError(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        promise.fulfill()
        //XCTFail()
    }
    
}
