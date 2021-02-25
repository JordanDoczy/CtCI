//
//  Chapter4FirstCommonAncestor.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/24/21.
//

import Foundation

class Chapter4FirstCommonAncestor {
    
    // BFS
    static func findDepth<T>(of node: TreeNode<T>, in nodes: [TreeNode<T>], depth: Int = 0) -> Int {
        guard nodes.count > 0 else {
            return -1 // node not found
        }
        
        var children: [TreeNode<T>] = []
        for child in nodes {
            if child == node {
                return depth // node found
            } else {
                if let left = child.left {
                    children.append(left)
                }
                if let right = child.right {
                    children.append(right)
                }
            }
        }
        return findDepth(of: node, in: children, depth: depth + 1)
    }
    
    static func commonAncestor<T>(n: TreeNode<T>, m: TreeNode<T>, tree: TreeNode<T>) -> TreeNode<T>? {
        
        var nParent = n.parent
        var nDepth = findDepth(of: n, in: [tree]) // O(n)
        
        var mParent = m.parent
        var mDepth = findDepth(of: m, in: [tree]) // (On)

        while nDepth != mDepth && nDepth > 0 && mDepth > 0 { // O(n/2)
            if nDepth > mDepth {
                nParent = nParent?.parent
                nDepth -= 1
            } else {
                mParent = mParent?.parent
                mDepth -= 1
            }
        }
        
        while nParent != mParent && nParent != nil && mParent != nil { // O(n/2)
            nParent = nParent?.parent
            mParent = mParent?.parent
        }
        
        return nParent ?? mParent
    }
    
    static func test() -> Bool {
        let tree = getTree()
        let n = tree.left!.right!.left!
        let m = tree.left!.right!.right!.right!
        print(n.data, m.data)
        if let ancestor = commonAncestor(n: m, m: n, tree: tree) {
            return ancestor.data == 16
        }
        return false
    }
    
    static func getTree() -> TreeNode<Int> {
        
        let tree = TreeNode(data: 10)
        tree.left = TreeNode(data: 8)
        tree.left!.left = TreeNode(data: 15)
        tree.left!.left!.left = TreeNode(data: 1)
        tree.left!.right = TreeNode(data: 16)
        tree.left!.right!.left = TreeNode(data: 7)
        tree.left!.right!.right = TreeNode(data: 30)
        tree.left!.right!.right!.right = TreeNode(data: 50)
        tree.right = TreeNode(data: 24)
        tree.right!.left = TreeNode(data: 19)
        tree.right!.right = TreeNode(data: 20)
        return tree
    }
    
}
