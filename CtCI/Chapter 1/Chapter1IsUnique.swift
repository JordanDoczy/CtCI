//
//  Chapter1IsUnique.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/16/21.
//

import Foundation

class Chapter1IsUnique {

    // requirements
    // given a string s, return true if s is unique
    
    // time: O(n)
    // storage: O(n)
    static func setCompare(s: String) -> Bool {
        return s.count == Set(s).count
    }
    
    // time: O(n logn)
    // storage: O(n)
    static func sortAndLook(s: String) -> Bool {
        
        let s = s.sorted()
        var prev = Character("-")

        for c in s {
            if prev == c {
                return false
            }
            prev = c
        }
        
        return true
    }
    
}
