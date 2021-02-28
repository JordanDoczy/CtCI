//
//  Chapter5FlipBitToWin.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/28/21.
//

import Foundation

class Chapter5FlipBitToWin {
    
    static func getLongestSequenceCount(from number: UInt, ones: Bool = true) -> Int {
        
        var mask: UInt = 1
        var counter = 0
        var maxCount = 0
        var zeroPosition = -1
        
        for i in 0..<UInt.bitWidth-number.leadingZeroBitCount {
            mask = 1 << i // create mask of 1 followed by i 0s
            
            if number & mask == 0 { // if a 0 is found
                if zeroPosition >= 0 { // if this are second or higher zero
                    maxCount = max(maxCount, counter) // update max count
                    counter -= zeroPosition // offset current count
                }
                zeroPosition = counter + 1 // update the position of the most recently found zero
            }
            
            counter += 1 // increment
        }
        
        return max(maxCount, counter) // check counter one last time

    }
    
    static func test() -> Bool {
        let compare = 3
        let value: UInt = 0b001010011000101
        let length = getLongestSequenceCount(from: value)
//        print(String(value, radix: 2))
//        print(length)
        
        return length == compare
    }
    
}
