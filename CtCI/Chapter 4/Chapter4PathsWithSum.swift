//
//  Chapter4PathsWithSum.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/25/21.
//

import Foundation

class Chapter4PathsWithSum {
    
    static func test() -> Bool {

        let tree = getTree()
        let numberOfPaths = tree.countPaths(for: 25)
        print("numberOfPaths= \(numberOfPaths)")
        
        return numberOfPaths == 5
    }
    
    static func getTree() -> TreeNode<Int> {
        let tree = TreeNode(data: 10)
        
        let left = TreeNode(data: -5)
        left.left = TreeNode(data: -20)
        left.left!.left = TreeNode(data: 50)
        left.right = TreeNode(data: 30)

        let right = TreeNode(data: 15)
        right.left = TreeNode(data: 10)
        right.right = TreeNode(data: 50)
        right.right!.left = TreeNode(data: -25)
        
        tree.left = left
        tree.right = right
            
        return tree
    }
    
}
