//
//  Chapter1ReplaceSpaces.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/17/21.
//

import Foundation

class Chapter1ReplaceSpaces {
    
    // replace all " " with "%20"
    // string has enough space to hold additional characters
        
    static func replaceSpacesAuto(s: String) -> String {
        let s = s.trimmingCharacters(in: [" "])
        return s.replacingOccurrences(of: " ", with: "%20")
    }

    static func replaceSpacesManual(s: String) -> String {
        var result = s
        var resultIndex = 0
        let space:Character = " "
        
        for _ in 0..<s.count {
            let range = result.index(result.startIndex, offsetBy: resultIndex)
            let char = result[range]
            if char == space {
                let remainder = result.index(range, offsetBy: 1)
                let end = result.index(result.endIndex, offsetBy: -2)
                result = result[..<range] + "%20" + result[remainder..<end]
                resultIndex += 2
            }
            resultIndex += 1
            if resultIndex == result.count {
                break
            }
        }

        return result
    }

}
