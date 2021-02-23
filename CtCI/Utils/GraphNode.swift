//
//  GraphNode.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/22/21.
//

import Foundation

class GraphNode<T: Hashable & Comparable & Equatable> {
    var data: T
    var time: Int
    var searched: Bool = false
    private(set) var children: Set<GraphNode>
    
    init(data: T) {
        self.data = data
        time = Int(mach_absolute_time())
        children = Set<GraphNode>()
    }
    
    func addChild(_ node: GraphNode) {
        children.insert(node)
    }
    
    func removeChild(_ node: GraphNode) {
        children.remove(node)
    }
    
    func hasLoop(_ node: GraphNode<T>?=nil) -> Bool {
        
        guard node != self else {
            return true
        }
        
        let ref = node == nil ? self : node
        
        for child in children {
            if child.hasLoop(ref) {
                return true
            }
        }
        
        return false
    }
}

extension GraphNode: Comparable {
    static func < (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    static func <= (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data <= rhs.data
    }
    
    static func > (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data > rhs.data
    }
    
    static func >= (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        return lhs.data >= rhs.data
    }
}

extension GraphNode: Equatable {
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        lhs.data == rhs.data
    }
    
    static func === (lhs: GraphNode, rhs: GraphNode) -> Bool {
        lhs.time == rhs.time
    }
}

extension GraphNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(time)
    }
}
