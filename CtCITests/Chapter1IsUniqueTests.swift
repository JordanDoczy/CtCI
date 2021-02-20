//
//  C1. Is Unique Tests.swift
//  CtCITests
//
//  Created by Jordan Doczy on 2/16/21.
//

import XCTest
@testable import CtCI

class Chapter1IsUniqueTests: XCTestCase {

    var chapter1: Chapter1IsUnique!
    var uniqueStrings: [String:Bool]!
   
    override func setUpWithError() throws {
        uniqueStrings = [:]
        uniqueStrings["Here is a string that is not unique."] = false
        uniqueStrings["A Unique"] = true
        uniqueStrings[""] = true
        uniqueStrings["0"] = true
        uniqueStrings["ñ0"] = true
    }

    override func tearDownWithError() throws { }

    func testSetCompare() throws {
        for (key, value) in uniqueStrings {
            XCTAssertEqual(Chapter1IsUnique.setCompare(s: key), value)
        }
    }

    func testSortAndLook() throws {
        for (key, value) in uniqueStrings {
            XCTAssertEqual(Chapter1IsUnique.sortAndLook(s: key), value)
        }
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
