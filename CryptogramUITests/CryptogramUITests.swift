//
//  CryptogramUITests.swift
//  CryptogramUITests
//
//  Created by Nick Sagan on 09.02.2022.
//

import XCTest

class CryptogramUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKeyGeneratorButtonAndTextView() throws {
        let app = XCUIApplication()
        app.launch()
        let tv = app.textViews["keyTextView"]
        XCTAssertEqual((tv.value as! String).count, 64)
        app.buttons["generateKey"].tap()
        XCTAssertEqual((tv.value as! String).count, 64)
    }
    
    
    func testEncryption() throws {
        let app = XCUIApplication()
        app.launch()
        let input = app.textViews["input"]
        let encrypt = app.buttons["encrypt"]
        let output = app.textViews["output"]
        
        input.tap()
        input.typeText("Test text")
        encrypt.tap()
        XCTAssertNotNil(output.value)
        XCTAssertEqual(input.value as! String, "Test text")
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
