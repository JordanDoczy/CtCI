//
//  Chapter4CheckSubtree.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/24/21.
//

import Foundation

class Chapter4CheckSubtree {
    
    
    static func isSubTree<T>(check t2:TreeNode<T>, in t1:TreeNode<T>) -> Bool {
        
        let t2Depth = t2.getMaxDepth()
        let t2Leaves = t2.getLeaves()
        let t1Leaves = t1.getLeaves()
        
        var match = false
        for t2Leaf in t2Leaves {
            match = false
            for t1Leaf in t1Leaves { 
                if nodesAreEqual(a: t1Leaf, b: t2Leaf, for: t2Depth) {
                    //print("found match: \(t1Leaf.data) \(t2Leaf.data)")
                    match = true
                    break
                }
            }
            if match == false {
                return false
            }
        }
        
        return true
    }
    
    static func nodesAreEqual<T>(a: TreeNode<T>?, b: TreeNode<T>?, for depth: Int) -> Bool {
        guard let a = a, let b = b else {
            return false
        }

        if depth == 1 {
            return a.data == b.data
        } else if a.direction == b.direction &&
                    a.sibling?.data == b.sibling?.data &&
                    a.data == b.data {
            return nodesAreEqual(a: a.parent, b: b.parent, for: depth - 1)
        }
        
        return false
    }
    
    static func test() -> Bool {
        let t1 = getT1()
        let t2 = getT2()
        let isSub = isSubTree(check: t2, in: t1)
        print("isSub= \(isSub)")
        return isSub
    }
    
    static func getT2() -> TreeNode<Int> {
//        let t2 = TreeNode(data: 30)
//        t2.left = TreeNode(data: 24)
//        t2.left!.right = TreeNode(data: 5)
//        t2.right = TreeNode(data: 11)
//        t2.right!.left = TreeNode(data: 6)
//        t2.right!.right = TreeNode(data: 2)
        
        let t2 = TreeNode(data: 50)
        t2.left = TreeNode(data: 90)
        t2.right = TreeNode(data: 99)
        return t2
    }
    
    static func getT1() -> TreeNode<Int> {
        let t1 = TreeNode(data: 15)
        
        let left = TreeNode(data: 30)
        left.left = TreeNode(data: 24)
        left.left!.right = TreeNode(data: 5)
        left.right = TreeNode(data: 11)
        left.right!.left = TreeNode(data: 6)
        left.right!.right = TreeNode(data: 2)
        
        let right = TreeNode(data: 8)
        right.left = TreeNode(data: 7)
        right.right = TreeNode(data: 50)
        right.right!.right = TreeNode(data: 99)
        right.right!.left = TreeNode(data: 90)
        //right.right!.left!.left = TreeNode(data: 40)
        
        t1.left = left
        t1.right = right
            
        return t1
    }
    
}
