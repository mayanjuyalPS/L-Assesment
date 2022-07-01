//
//  UserViewModelTest.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 29/06/22.
//

import XCTest
import Combine
import Swinject
@testable import LyodsAssesment

class UserViewModelTest: XCTestCase {
    
    var userViewModel: IProductViewModel?
    var cancellable: Set<AnyCancellable> = .init()
    
    override func setUp() {
        super.setUp()
        Assembler.type = .test
        userViewModel = Assembler.sharedAssembler.resolver.resolve(IProductViewModel.self)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewModel_Success() {
        let promise = expectation(description: "Should get success")
        userViewModel?.status.sink { status in
            switch status {
            case .loading, .none:
                print("Nothing")
            case .success:
                print("Suceess Check")
                promise.fulfill()
            case .failed(_):
                promise.fulfill()
                XCTFail()
            }
        }.store(in: &cancellable)
        userViewModel?.fetchProducts()
        wait(for: [promise], timeout: 10.0)
    }


}
