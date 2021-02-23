//
//  Chapter4ValidateBST.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/23/21.
//

import Foundation

class Chapter4ValidateBST {

    static func isBST<T>(node: TreeNode<T>?, upperBound:T, lowerBound:T)  -> Bool {
        guard let node = node else {
            return true
        }
        
        if node.data > upperBound || node.data <= lowerBound {
            print(node.data)
            return false
        }
        
        return isBST(node: node.left, upperBound: node.data, lowerBound: lowerBound) &&
            isBST(node: node.right, upperBound: upperBound, lowerBound: node.data)
    }
    
    static func test() -> Bool {
        
        let tree = getTree()
        let max: Int = Int(INT8_MAX)
        let min: Int = Int(INT8_MIN)
        return isBST(node: tree, upperBound: max, lowerBound: min)
    }
    
    static func getTree() -> TreeNode<Int> {
        let tree = TreeNode(data: 7)
        tree.left = TreeNode(data: 3)
        tree.left!.left = TreeNode(data: 1)
        tree.left!.right = TreeNode(data: 4)
        tree.left!.right!.right = TreeNode(data: 6)
        tree.left!.right!.right!.left = TreeNode(data: 5)
        tree.right = TreeNode(data: 12)
        tree.right!.left = TreeNode(data: 6) // bad value - lower than root
        return tree
    }
    
    
}
