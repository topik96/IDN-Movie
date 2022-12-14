//
//  IDN_MovieUITests.swift
//  IDN-MovieUITests
//
//  Created by Topik Mujianto on 08/08/22.
//

import XCTest
@testable import IDN_Movie

class IDN_MovieUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOpenMovieDetail() throws {
        let app = XCUIApplication()
        app.launch()

        Thread.sleep(forTimeInterval: 0.8)
        app.collectionViews.cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.tables["tableView"].exists)
    }
}
