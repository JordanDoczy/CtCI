//
//  TreeNode.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/20/21.
//

import Foundation

class TreeNode<T: Hashable & Comparable & Equatable> {
    
    enum TreeDirection {
        case left, right
    }
    
    /// Storage
    var data: T
    private(set) var size = 0
    var time: Int
    
    /// Computed properties
    var direction: TreeDirection? {
        get {
            if parent?.left == self {
                return .left
            } else if parent?.right == self {
                return .right
            }
            return nil
        }
    }
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    /// Pointers
    weak var parent: TreeNode?
    var left: TreeNode? {
        didSet {
            left?.parent = self
        }
    }
    var right: TreeNode? {
        didSet {
            right?.parent = self
        }
    }
    var sibling: TreeNode? {
        get {
            guard let direction = direction else { return nil } // no direction? we're the root
            switch direction {
            case .left:
                return parent?.right
            case .right:
                return parent?.left
            }
        }
    }
    
    init(data: T) {
        self.data = data
        time = Int(mach_absolute_time())
    }
    
    /// Helper functions
    func insertInOrder(_ value: T) {
        if value > data {
            if let right = right {
                right.insertInOrder(value)
            } else {
                right = TreeNode(data: value)
            }
        } else {
            if let left = left {
                left.insertInOrder(value)
            } else {
                left = TreeNode(data: value)
            }
        }
        size += 1
    }
    
    func findNode(with value: T) -> TreeNode? {
        return TreeNode.findNode(from: self, with: value)
    }
    
    func getLeaves() -> [TreeNode] {
        return TreeNode.getLeaves(from: self)
    }
    
    func getMaxDepth() -> Int {
        return TreeNode.getMaxDepth(at: self)
    }

    func getValuesBFS() -> [[T?]] {
        return TreeNode.getValuesBFS(nodes: [self])
    }
    
}

/// Static functions
extension TreeNode {
    
    static func buildBST(from values: [T]) -> TreeNode<T>? {
        guard let rootValue = values.first else { return nil }
        
        let root = TreeNode(data: rootValue)
        guard values.count > 1 else { return root }
        
        for i in 1..<values.count {
            root.insertInOrder(values[i])
        }
        
        return root
    }
    
    static func findNode(from root: TreeNode?, with value: T) -> TreeNode? {
        guard let root = root else { return nil }
        if root.data == value { return root }

        if let left = findNode(from: root.left, with: value) {
            return left
        }

        if let right = findNode(from: root.right, with: value) {
            return right
        }
        
        return nil
    }
    
    static func getLeaves(from node: TreeNode?) -> [TreeNode] {
        guard let node = node else {
            return []
        }
        
        if node.isLeaf {
            return [node]
        }
        
        var result: [TreeNode] = []
        result += getLeaves(from: node.left)
        result += getLeaves(from: node.right)
        
        return result
    }
    
    static func getMaxDepth<T>(at node: TreeNode<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftDepth = getMaxDepth(at: node.left) + 1
        let rightDepth = getMaxDepth(at: node.right) + 1
        return max(leftDepth, rightDepth)
    }

    static func getValuesBFS<T>(nodes: [TreeNode<T>?]) -> [[T?]] {
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
    
        return [result] + getValuesBFS(nodes: children)
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
        lhs.time == rhs.time
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
