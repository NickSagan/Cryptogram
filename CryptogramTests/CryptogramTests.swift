//
//  CryptogramTests.swift
//  CryptogramTests
//
//  Created by Nick Sagan on 09.02.2022.
//

import XCTest
@testable import Cryptogram

class CryptogramTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTextViewPlaceholders() throws {
        let mv = MainView()
        XCTAssertTrue(!mv.outputPlaceholder.isEmpty)
        XCTAssertTrue(!mv.inputPlaceholder.isEmpty)
        XCTAssertEqual(mv.input.text, "Paste the text you want to encrypt or decrypt here")
        XCTAssertEqual(mv.output.text, "The decrypted or encrypted text will appear here")
        
    }
    
    func testPlaceholdersColoursAfterViewDidLoad() throws {
        let vc = MainVC()
        vc.viewDidLoad()
        XCTAssertEqual(vc.mainView.output.textColor, UIColor.lightGray)
        XCTAssertEqual(vc.mainView.input.textColor, UIColor.lightGray)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
