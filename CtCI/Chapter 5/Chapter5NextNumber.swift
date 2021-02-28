//
//  Chapter5NextNumber.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/28/21.
//

import Foundation

class Chapter5NextNumber {

    static func findNextNumbers(_ value: UInt) -> (low: Int, high: Int) {

        guard value.nonzeroBitCount > 0 else {
            return (-1,-1)
        }
        
        let lsb: UInt = 1 << value.trailingZeroBitCount
        let msb: UInt = 1 << (value.bitWidth - value.leadingZeroBitCount - 1)

        // if our firstZero is greater than our most significant bit, we can not find a lower value
        guard let firstZero = findNextZero(value: value, from: 1),
              firstZero < msb else {
            return (-1,-1)
        }
        
        let firstBit = lsb
        
        guard let firstZeroFollowingBit = firstZero > 1 ?
                firstZero :
                findNextZero(value: value, from: firstBit) else {
            return (-1,-1)
        }

        guard let firstBitFollowingZero = firstBit > firstZero ?
                firstBit :
                findNextBit(value: value, from: firstZeroFollowingBit << 1) else {
            return (-1,-1)
        }

//        print("firstBit= \(String(firstBit, radix: 2))")
//        print("firstZero= \(String(firstZero, radix: 2))")
//        print("firstZeroFollowingBit= \(String(firstZeroFollowingBit, radix: 2))")
//        print("firstBitFollowingZero= \(String(firstBitFollowingZero, radix: 2))")
//

        var mask = (firstZeroFollowingBit - 1) // mask of 11111s
        var upper = value
        upper |= firstZeroFollowingBit // flip 0 bit
        upper &= ~mask // remove values from right side of 0 bit
        upper += (value & (mask >> 1)) >> value.trailingZeroBitCount // shift values of right side of 0 bit and add them back to upper

        mask = (firstBitFollowingZero - 1) // mask of 11111s
        var lower = value
        lower = value
        lower &= ~firstBitFollowingZero // flip bit to 0
        lower += (firstBitFollowingZero >> 1) // flip bit preceding to 1
        lower &= ~(mask >> 1) // remove values from right side of 0 bit
        let remainingValues = (value & (mask >> 1))
        let shift = mask.nonzeroBitCount - remainingValues.nonzeroBitCount - 1
        lower += remainingValues << shift

        return (Int(lower), Int(upper))
    }
    
    static func findNextZero(value: UInt, from: UInt) -> UInt? {
        
        var nsb: UInt = from
        
        while nsb & value > 0 && nsb.trailingZeroBitCount < UInt64.bitWidth - 1 {
            nsb <<= 1
        }
        
        return nsb & value == 0 ? nsb : nil
    }
    
    static func findNextBit(value: UInt, from: UInt) -> UInt? {
        
        var nsb: UInt = from
        
        while nsb & value <= 0 && nsb.trailingZeroBitCount < UInt64.bitWidth - 1 {
            nsb <<= 1
        }
        
        return nsb & value > 0 ? nsb : nil
    }
    

    static func runTest(_ test: (value: UInt, low: Int, high: Int)) -> Bool {
        print("NEW TEST")
        print(String(test.value, radix: 2))
        let result = findNextNumbers(test.value)
        print(test.value, result, String(result.low, radix: 2), String(result.high, radix: 2))
        
        return result.low == test.low && result.high == test.high
    }
    
    static func runTests() -> Bool {
        var tests: [(value: UInt, low: Int, high: Int)] = []
        tests.append((value: 0b1000111, low: 60, high: 75))
        tests.append((value: 0b1001110, low: 77, high: 83))
        tests.append((value: 0b100011100, low: 282, high: 291))
        tests.append((value: 0b101, low: 3, high: 6))
        tests.append((value: 0b1, low: -1, high: -1))
        tests.append((value: 0b10, low: 1, high: 4))
        
        for test in tests {
            if runTest(test) == false {
                return false
            }
                
        }

        return true
    }
}
