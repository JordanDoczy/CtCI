//
//  Chapter5PairwiseSwap.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/28/21.
//

import Foundation

class Chapter5PairwiseSwap {

    typealias Test = (input: UInt32, output: UInt32)
    
    // brute force
    // step through each bit flip bit and bit + 1

    /*
     swap even and odd places
     In:    1101
     Out:   1110
     -----------
     In:    10110101
     Out:   01111010
     
     Out:       01111010
     
     In:        10110101
     Odd:       01010101
     Intersect: 00010101
     Shift < 1: 00101010
     
     In:        10110101
     Even:      10101010
     Intersect: 10100000
     Shift > 1: 01010000
     
     Even Vals: 01010000
     Odd Vals:  00101010
     Even + Odd:01111010
     
     How do we create a mask of alternating values?
     */
    
    static func pairwiseSwap(_ input: UInt32) -> UInt32 {
        let even: UInt32 = 0xAAAAAAAA
        let odd: UInt32 =  0x55555555
        
        let evenValues = (input & even) >> 1
        let oddValues = (input & odd) << 1
        
        return evenValues | oddValues
    }
    
    static func runTest(_ test: Test) -> Bool {
        let output = pairwiseSwap(test.input)
        print(test, output)
        return test.output == output
    }
    
    static func runTests() -> Bool {
        var tests: [Test] = []
        tests.append((input: 0b10110101, output: 0b01111010))
        tests.append((input: 0b1101, output: 0b1110))
        tests.append((input: 0b1, output: 0b10))
        
        for test in tests {
            if runTest(test) == false {
                return false
            }
        }
        
        return true
    }
}
