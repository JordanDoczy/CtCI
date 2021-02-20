//
//  Chapter1StringCompression.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/17/21.
//

import Foundation

class Chapter1StringCompression {
    
    static func stringCompression(_ s: String) -> String {
        
        guard s.count > 2 else {
            return s
        }
        
        var result = ""
        var charCount = 0
        var prevChar = s.first!
        
        for char in s {
            if prevChar != char {
                result += "\(prevChar)\(charCount)"
                charCount = 0
            }
            prevChar = char
            charCount += 1
        }
        
        result += charCount > 0 ? "\(prevChar)\(charCount)" : ""

        return result.count < s.count ? result : s
    }
    
}

