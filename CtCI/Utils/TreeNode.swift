//
//  TreeNode.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/20/21.
//

import Foundation

class TreeNode<T: Hashable & Comparable & Equatable> {
    
    var left: TreeNode?
    var right: TreeNode?
    var data: T
    var time: Int
    
    init(data: T) {
        self.data = data
        time = Int(mach_absolute_time())
    }
    
    static func printNodeDepthFirst<T>(_ node: TreeNode<T>?, prefix: String="") {
        guard let node = node else { return }
        
        print(prefix, node.data)
        printNodeDepthFirst(node.left, prefix: prefix + "\(node.data) > left: ")
        printNodeDepthFirst(node.right, prefix: prefix + "\(node.data) > right: ")
    }
    
    static func getValuesBreadthFirst<T>(nodes: [TreeNode<T>?]) -> [[T?]] {
        guard nodes.count > 0 else {
            return []
        }
        
        var result: [T?] = []
        var children: [TreeNode<T>?] = []
        for node in nodes {
            result.append(node?.data)
            if node != nil && (node!.left != nil || node!.right != nil) {
                children.append(node!.left)
                children.append(node!.right)
            }
        }
    
        return [result] + getValuesBreadthFirst(nodes: children)
    }
    
}

extension TreeNode: Comparable {
    static func < (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    static func <= (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.data <= rhs.data
    }
    
    static func > (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.data > rhs.data
    }
    
    static func >= (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.data >= rhs.data
    }
}

extension TreeNode: Equatable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.data == rhs.data
    }
    
    static func === (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.time == rhs.time
    }
}

extension TreeNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(time)
    }
}
