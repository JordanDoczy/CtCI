//
//  Chapter5Insertion.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/27/21.
//

import Foundation

class Chapter5Insertion {
    
    static func insert(_ m: Int, into n: Int, from j: Int, through i: Int) -> Int {
        
        // create mask
        var mask: Int = 1 << (j-1) // step 1 : 1 followed by j-1 0s ex: 1000 where j=4
        mask = mask - 1 // step 2: (j-1) 1s ex: 111
        mask = mask << i // step 3: (j-1) 1s followed by i 0s ex: 11100 where i = 2
        
        // flip bits in n
        let n = n & ~mask
        
        // shift bits on m
        let shift = m << i
        
        return n | shift
    }
    
    static func test() -> Bool {
        
        let result = insert(0b10011, into: 0b10100001001, from: 6, through: 2)
        print("result=\(String(result, radix: 2))")
        
        return result == 0b10101001101
    }
    
}
