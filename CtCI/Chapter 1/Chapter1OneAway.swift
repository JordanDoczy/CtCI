//
//  Chapter1OneAway.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/17/21.
//

import Foundation

class Chapter1OneAway {
    
    static func isOneAway(a: String, b: String) -> Bool {
        guard abs(a.count - b.count) <= 1 else {
            return false
        }
        
        // determine if one string is shorter than the other
        let shortString = a.count < b.count ? a : b
        let longString = shortString == a ? b : a
        let shortStringCount = shortString.count
        let longStringCount = longString.count

        // loop through the shorter string
        for i in 0..<shortStringCount {
            let index = shortString.index(shortString.startIndex, offsetBy:i)

            if shortString[index] != longString[index] { // if we find a mismatch, then check the remainder of each string
                let longStringIndex = longString.index(index, offsetBy: 1)
                let shortStringIndex = shortStringCount == longStringCount ? longStringIndex : index // determine the start position of the shorter string
                return shortString[shortStringIndex...] == longString[longStringIndex...]
            }
        }
        
        return true
    }
    
}
