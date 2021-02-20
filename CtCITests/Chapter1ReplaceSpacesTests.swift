//
//  Chapter1ReplaceSpacesTests.swift
//  CtCITests
//
//  Created by Jordan Doczy on 2/17/21.
//

import XCTest
@testable import CtCI

class Chapter1ReplaceSpacesTests: XCTestCase {

    var strings: [String:String]!
   
    override func setUpWithError() throws {
        strings = [:]
        strings["test me oooh test me!        "] = "test%20me%20oooh%20test%20me!"
        strings["test"] = "test"
        strings[""] = ""
    }

    override func tearDownWithError() throws { }

    func testReplaceSpacesManual() throws {
        for (key, value) in strings {
            XCTAssertEqual(Chapter1ReplaceSpaces.replaceSpacesManual(s: key), value)
        }
    }
    
    func testReplaceSpacesAuto() throws {
        for (key, value) in strings {
            XCTAssertEqual(Chapter1ReplaceSpaces.replaceSpacesAuto(s: key), value)
        }
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
