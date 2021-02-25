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
    private(set) var size = 1
    var time: Int
    var canSearch: Bool = true
    
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
        if data == value { return self }

        if let left = left?.findNode(with: value) {
            return left
        }

        if let right = right?.findNode(with: value) {
            return right
        }
        
        return nil
    }
    
    func getChildren() -> [TreeNode] {
        
        var children: [TreeNode] = []
        
        if let left = left {
            children.append(left)
            children += left.getChildren()
        }
        if let right = right {
            children.append(right)
            children += right.getChildren()
        }

        return children
    }
    
    func getNode(at index: Int) -> TreeNode? {
        guard index >= 0 else { return nil }
        
        let leftSize = left?.size ?? 0
        
        if index == leftSize { return self }
        else if index < leftSize { return left!.getNode(at: index) }
        else { return right?.getNode(at: index - leftSize - 1) }
    }
    
    func getLeaves() -> [TreeNode] {
        if isLeaf { return [self] }
        
        var result: [TreeNode] = []
        result += left?.getLeaves() ?? []
        result += right?.getLeaves() ?? []
        
        return result
    }
    
    func getMaxDepth() -> Int {
        let leftDepth = (left?.getMaxDepth() ?? 0) + 1
        let rightDepth = (right?.getMaxDepth() ?? 0) + 1
        return max(leftDepth, rightDepth)
    }

    func getValuesBFS() -> [[T?]] {
        return TreeNode.getValuesBFS(nodes: [self])
    }
    
    func countPaths(for value: Int) -> Int {
        return countPaths(for: value, originalValue: value)
    }
    
    private func countPaths(for value: Int, originalValue: Int, path: [Int] = []) -> Int {
        //print("node=\(data), searching for \(value), my parent=\(parent?.data)")
        
        guard let myValue = data as? Int else { return 0 }
        
        
        if path.isEmpty { canSearch = false }
        
        var paths = 0
        var path = path // make mutable
        path.append(myValue)

        if value == myValue { // we have found a path
            print("found path: \(path)")
            paths += 1
        }
        if let left = left { // check continuation and starting from here
            paths += left.countPaths(for: value-myValue, originalValue: originalValue, path: path)
            if left.canSearch { paths += left.countPaths(for: originalValue, originalValue: originalValue, path: []) }
        }
        if let right = right { // check continuation and starting from here
            paths += right.countPaths(for: value-myValue, originalValue: originalValue, path: path)
            if right.canSearch { paths += right.countPaths(for: originalValue, originalValue: originalValue, path: []) }
        }
        
        return paths
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
