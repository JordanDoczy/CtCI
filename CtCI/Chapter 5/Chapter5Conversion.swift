//
//  Chapter5Conversion.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/28/21.
//

import Foundation

class Chapter5Conversion {
    
    typealias Test = (a: Int, b: Int, result: Int)
    
    static func conversionEffort(a: Int, b: Int) -> Int {
            
        let  counter = (a^b).nonzeroBitCount
        
        
//        var counter = 0
//
//        for i in 0..<Int.bitWidth {
//            let mask = 1 << i
//            counter += (a & mask) == (b & mask) ? 0 : 1
//        }
        
        return counter
    }
    
    static func runTest(_ test: Test) -> Bool {
        let result = conversionEffort(a: test.a, b: test.b)
        print(test, result)
        return result == test.result
    }
    
    static func runTests() -> Bool {
        
        var tests: [Test] = []
        tests.append((a: 0b11101, b:0b1111, result: 2))
        tests.append((a: 0b101, b:0b101, result: 0))
        tests.append((a: 0b1011111001010, b:0b101101110001011, result: 5))
        for test in tests {
            if runTest(test) == false {
                return false
            }
        }
        
        return true
    }
    
}

