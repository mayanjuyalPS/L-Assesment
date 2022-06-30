//
//  LyodsAssesmentUITests.swift
//  LyodsAssesmentUITests
//
//  Created by Mayank Juyal on 29/06/22.
//

import XCTest

class LyodsAssesmentUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_TableView() {
        app.launch()
        
        let articleTableView = app.tables["table-Users"]
        
        XCTAssertTrue(articleTableView.exists, "The article tableview exists")
        
        let tableCells = articleTableView.cells
        XCTAssert(tableCells.element.waitForExistence(timeout: 5.0))
//        let cell = tableCells.element(boundBy: 0)
//        XCTAssert(cell.waitForExistence(timeout: 5.0))
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
         
            let promise = expectation(description: "Wait for table cells")
         
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.waitForExistence(timeout: 5.0), "The \(i) cell is in place on the table")
                // Does this actually take us to the next screen
                tableCell.tap()
         
                if i == (count - 1) {
                    promise.fulfill()
                }
                // Back
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
         
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
