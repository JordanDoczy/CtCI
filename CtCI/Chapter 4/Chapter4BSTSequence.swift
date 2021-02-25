//
//  Chapter4BSTSequence.swift.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/24/21.
//

import Foundation

class Chapter4BSTSequence {
    
        
    static func getArrays<T>(from tree: TreeNode<T>) -> [[T]] {
        
        var children = getChildren(from: [tree])
        var permutationResults = [[tree.data]]
        
        while !children.isEmpty {
            let values: [T] = children.map { $0.data }
            let permutations = generatePermutations(values)
            permutationResults = mergePermutations(p1: permutationResults, p2: permutations)
            children = getChildren(from: children)
        }
        
        
        return permutationResults
    }
    
    static func mergePermutations<T>(p1: [[T]], p2: [[T]]) -> [[T]] {
        var result:[[T]] = []
        
        for p in p1 {
            for pp in p2 {
                result.append(p + pp)
            }
        }
        
        return result
    }
    
    static func getChildren<T>(from nodes: [TreeNode<T>]) -> [TreeNode<T>] {
        
        var children: [TreeNode<T>] = []
        for node in nodes {
            if let left = node.left {
                children.append(left)
            }
            if let right = node.right {
                children.append(right)
            }
        }
        
        return children
    }

    static func generatePermutations<T>(_ values: [T], prefix: [T]=[]) -> [[T]] {
        var results: [[T]] = []
        if values.count == 1 {
            return [prefix + values]
        } else {
            for i in 0..<values.count {
                let left = values.index(values.startIndex, offsetBy: i)
                let right = values.index(left, offsetBy: 1)
                results += generatePermutations(Array(values[values.startIndex..<left] + values[right...]),
                                             prefix: prefix + Array(arrayLiteral: values[left]))
            }
        }
        
        return results
    }
    
    static func test() -> Bool {
        if let bst = TreeNode.buildBST(from: [50,20,60,10,25,70]) {
            let arrays = getArrays(from: bst)
            print (arrays)
        }
        
        return true
    }
    
}
