//
//  Chapter4Successor.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/23/21.
//

import Foundation

class Chapter4Successor {
    
    static func getSuccessorPreOrder<T>(_ node: TreeNode<T>?) -> TreeNode<T>? {
        
        guard let node = node else {
            return nil
        }
        
        guard node.left == nil else {
            return node.left
        }
        
        guard node.right == nil else {
            return node.right
        }
        
        
        var parent: TreeNode<T>? = node.parent
        var next: TreeNode<T>?
        var current: TreeNode<T>? = node
        
        while next == nil && parent != nil {
            next = parent?.right
            if next == current {
                next = nil
            }
            current = parent
            parent = parent?.parent
        }
        
        return next
    }
    
    static func getSuccessorInOrder<T>(_ node: TreeNode<T>?) -> TreeNode<T>? {
        
        guard let node = node else {
            return nil
        }
        
        if let right = node.right{
            return leftMostChild(right)
        } else {

            var current: TreeNode<T>? = node
            var parent: TreeNode<T>? = node.parent
            
            while parent != nil && parent?.left?.data != current?.data {
                current = parent
                parent = parent?.parent
            }
            
            return parent
        }
    }
    
    static func leftMostChild<T>(_ node: TreeNode<T>) -> TreeNode<T>? {
        guard let left = node.left else {
            return node
        }
        
        return leftMostChild(left)
    }

    static func getTree() -> TreeNode<Int> {
        
        let tree = TreeNode(data: 7)
        tree.left = TreeNode(data: 3)
        tree.left!.left = TreeNode(data: 1)
        tree.left!.right = TreeNode(data: 4)
        tree.left!.right!.right = TreeNode(data: 6)
        tree.left!.right!.right!.left = TreeNode(data: 5)
        tree.right = TreeNode(data: 12)
        tree.right!.left = TreeNode(data: 13)
        return tree
    }
    
    static func test() -> Bool {
        let tree = getTree()

//        var node: TreeNode? = tree
//        while node != nil {
//            node = getSuccessorPreOrder(node)
//            if let data = node?.data {
//                print("node.data= \(data)")
//            }
//        }
        
        var node: TreeNode? = tree.left?.left
        print("node.data= \(node!.data)")
        while node != nil {
            node = getSuccessorInOrder(node)
            if let data = node?.data {
                print("node.data= \(data)")
            }
        }
        
        return true
    }
    
}
