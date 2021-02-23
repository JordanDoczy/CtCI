//
//  Chapter4CheckBalanced.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/23/21.
//

import Foundation

class Chapter4CheckBalanced {
    
    static func checkBalanced() -> Bool {
        
        
        let tree = TreeNode(data: 5)
        tree.left = TreeNode(data: 3)
        tree.left!.left = TreeNode(data: 1)
        tree.left!.right = TreeNode(data: 4)
        tree.left!.right!.right = TreeNode(data: 6)
        tree.left!.right!.right!.left = TreeNode(data: 5)
        tree.right = TreeNode(data: 12)
        
        let leftDepth = TreeNode<Int>.maxDepth(tree.left)
        let rightDepth = TreeNode<Int>.maxDepth(tree.right)
        print("leftDepth= \(leftDepth); rightDepth= \(rightDepth);")
        
        return abs(leftDepth - rightDepth) <= 1
    }
    
    
}
