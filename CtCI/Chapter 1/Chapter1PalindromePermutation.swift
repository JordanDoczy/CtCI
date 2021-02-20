//
//  Chapter1PalindromePermutation.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/17/21.
//

import Foundation

class Chapter1PalindromePermutation {
    
    // find all possible palindromes from a string
    // ignore case
    // ignore white space
    
    static func findPermutations(s: String) -> [String] {
        var s = s.lowercased()
        s = s.replacingOccurrences(of: " ", with: "")

        var sMap:[Character:Int] = [:]
        
        // map all characters in string to a map
        for char in s {
            if sMap[char] == nil {
                sMap[char] = 0
            }
            sMap[char]! += 1
        }
        
        // if we have a string length of an odd number, we must have one char with only one occurance
        let numberOfOddOccurances = s.count % 2 == 0 ? 0 : 1
        let oddOccurances = sMap.filter({ $0.value % 2 != 0})
        guard oddOccurances.count == numberOfOddOccurances else {
            return []
        }
        
        // determine if we have a middle character
        let middleCharacter = oddOccurances.first != nil ? String(oddOccurances.first!.key) : ""

        // build an array of characters
        var chars:[Character] = []
        for (key,value) in sMap {
            if value > 1 { // exclude the odd character if we have one (this will be the middle character)
                for _ in 0..<value/2 { // reduce the values by half, we only need half since we will build a string then reverse it
                    chars.append(key)
                }
            }
        }

        // build the palindromic permutations
        let leftPermutations = buildPermutations(String(chars))
        
        var permutations:[String] = []
        var palindrome = ""
        for permutation in leftPermutations {
            palindrome = permutation + middleCharacter + permutation.reversed()
            permutations.append(palindrome)
        }
        print(permutations)
        
        return permutations
    }
    
    static func buildPermutations(_ str: String, prefix: String="") -> [String] {
        var results: [String] = []
        if str.count == 1 {
            return [prefix + str]
        } else {
            for i in 0..<str.count {
                let left = str.index(str.startIndex, offsetBy: i)
                let right = str.index(left, offsetBy: 1)
                results += buildPermutations(String(str[str.startIndex..<left] + str[right...]), prefix: prefix + String(str[left]))
            }
        }
        
        return results
    }
}
