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
    
    func testDecryption() throws {
        let app = XCUIApplication()
        app.launch()
        let input = app.textViews["input"]
        let decrypt = app.buttons["decrypt"]
        let output = app.textViews["output"]
        let key = app.textViews["keyTextView"]
        
        input.tap()
        input.typeText("f6697786da204385dd76b141530b657792175cb03e776eeb8084d65affc0cf55e1642ba03ffdbb861fb0730c14f135b7aa9aea9b407e750deeb3e97192b49f8ea89f4c91d95b2b4770e8da73eb9aff3e")
        key.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        key.typeText("4452d71687b6bc2c9389c3349fdc17fb3dfbba6224affb7676e1337926cdd602")

        decrypt.tap()
        XCTAssertNotNil(input.value)
        XCTAssertNotNil(key.value)
        XCTAssertEqual(output.value as! String, "Hello World")
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
