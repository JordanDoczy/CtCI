//
//  C1. Is Unique Tests.swift
//  CtCITests
//
//  Created by Jordan Doczy on 2/16/21.
//

import XCTest
@testable import CtCI

class Chapter1CheckPermutationTests: XCTestCase {

    var strings: [[String]:Bool]!
   
    override func setUpWithError() throws {
        strings = [:]
        strings[["ab", "ba"]] = true
        strings[["abc", "cbb"]] = false
    }

    override func tearDownWithError() throws { }

    func testCheckPermutation() throws {
        for (key, value) in strings {
            let a = key[0]
            let b = key[1]
            XCTAssertEqual(Chapter1CheckPermutation.checkPermutation(a: a, b: b), value)
        }
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
