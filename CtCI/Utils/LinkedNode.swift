//
//  LinkedNode.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class LinkedNode<T: Hashable & Comparable & Equatable> {
    
    internal let time: Int
    var data: T
    var next: LinkedNode<T>?
    
    var stringValue: String {
        return getStringValue()
    }
    
    init(data: T) {
        self.data = data
        time = Int(mach_absolute_time())
    }
    
    func getStringValue(useTime:Bool = false) -> String {
        var result = useTime ? "\(time)>" : "\(data)>"
        var node = next
        while node != nil {
            result += useTime ? "\(node!.time)>" : "\(node!.data)>"
            node = node!.next
        }
        return result
    }
    
    func getNode(at depth: Int) -> LinkedNode? {
        var node: LinkedNode? = self
        
        for _ in 0..<depth {
            node = node?.next
        }
        
        return node
    }

}

extension LinkedNode: Comparable {
    static func < (lhs: LinkedNode<T>, rhs: LinkedNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    static func <= (lhs: LinkedNode<T>, rhs: LinkedNode<T>) -> Bool {
        return lhs.data <= rhs.data
    }
    
    static func > (lhs: LinkedNode<T>, rhs: LinkedNode<T>) -> Bool {
        return lhs.data > rhs.data
    }
    
    static func >= (lhs: LinkedNode<T>, rhs: LinkedNode<T>) -> Bool {
        return lhs.data >= rhs.data
    }
}

extension LinkedNode: Equatable {
    static func == (lhs: LinkedNode, rhs: LinkedNode) -> Bool {
        lhs.data == rhs.data
    }
    
    static func === (lhs: LinkedNode, rhs: LinkedNode) -> Bool {
        lhs.time == rhs.time
    }
}

extension LinkedNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(time)
    }
}
