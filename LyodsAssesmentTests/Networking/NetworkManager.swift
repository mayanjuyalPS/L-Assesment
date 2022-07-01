//
//  NetworkManager.swift
//  LyodsAssesmentTests
//
//  Created by Mayank Juyal on 01/07/22.
//

import XCTest
@testable import LyodsAssesment

class NetworkManager: XCTestCase {
    
    var networkManager: MockNetworkManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkManager = MockNetworkManager()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNetworkManager_Success() {
        networkManager.product = MockData.product
        let request = NetworkRequest(path: "/product", method: .get)
        networkManager.request(ProductResposne.self, endPoint: request)
            .done { model in
                XCTAssertTrue((model as! ProductResposne).total == 3)
            }.catch { _ in
                XCTFail()
            }
    }
    
    func testNetworkManage_Failure() {
        networkManager.product = nil
        let request = NetworkRequest(path: "/product", method: .get)
        networkManager.request(ProductResposne.self, endPoint: request)
            .done { model in
                XCTAssertTrue((model as! ProductResposne).total == 3)
            }.catch { error in
                XCTAssertTrue((error as NSError).code == 1)
            }
    }
    
}
