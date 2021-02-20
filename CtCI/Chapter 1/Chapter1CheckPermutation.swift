//
//  Chapter1CheckPermutation.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/17/21.
//

import Foundation

class Chapter1CheckPermutation {
    // check if string a is a permutation of string b
    
    static func checkPermutation(a: String, b: String) -> Bool {
        guard a.count == b.count else {
            return false
        }
        
        var aMap:[Character:Int] = [:]
        

        for char in a {
            if aMap[char] == nil {
                aMap[char] = 0
            }
            aMap[char]! += 1
        }
        

        for char in b {
            if aMap[char] == nil {
                return false
            } else if aMap[char] == 1 {
                aMap[char] = nil
            } else {
               aMap[char]! -= 1
            }
        }
        
        return aMap.keys.isEmpty
    }
}
