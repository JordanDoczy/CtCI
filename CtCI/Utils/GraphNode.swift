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
    private(set) var children: [GraphNode]
    
    init(data: T) {
        self.data = data
        time = Int(mach_absolute_time())
        children = []
    }
    
    func addChild(_ node: GraphNode) {
        children.append(node)
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
