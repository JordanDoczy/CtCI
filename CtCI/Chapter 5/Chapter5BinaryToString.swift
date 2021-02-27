//
//  Chapter5BinaryToString.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/27/21.
//

import Foundation

class Chapter5BinaryToString {

    static func binaryToString(_ value: Double) -> String {
        guard value >= 0 && value <= 1 else { return "ERROR" }
        
        // convert value to Int
        var value = value
        while value - floor(value) > 0 {
            value *= 10 // not reliable, will result in rounding errors
        }

        var remaining = value

        // leave one for the "."
        guard remaining.exponent < 32 else { return "ERROR" }

        // initialize array to necessary size
        var result = Array(repeating: "0", count: remaining.exponent+1)

        while remaining > 0 {
            result[result.count-remaining.exponent-1] = "1" // flip value
            let reduceBy = 1 << remaining.exponent // create
            remaining = remaining - Double(reduceBy)
        }

        return ".\(result.reduce("", +))" // return as a string
    }
    
    static func test() -> Bool {

        let intValue = 4294967
        let value  = 0.4294967
        print(Double(intValue).exponent)
        let result = binaryToString(value)
        print("result= \(result) value= \(value), binary=.\(String(intValue, radix: 2))")

        return result == ".\(String(intValue, radix: 2))"
    }
    
}
