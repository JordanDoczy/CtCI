//
//  Node.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Node<T: Hashable & Comparable & Equatable> {
    
    internal let time: Int
    var data: T
    var next: Node<T>?
    
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
    
    func getNode(at depth: Int) -> Node? {
        var node: Node? = self
        
        for _ in 0..<depth {
            node = node?.next
        }
        
        return node
    }

}

extension Node: Comparable {
    static func < (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    static func <= (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data <= rhs.data
    }
    
    static func > (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data > rhs.data
    }
    
    static func >= (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data >= rhs.data
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.data == rhs.data
    }
    
    static func === (lhs: Node, rhs: Node) -> Bool {
        lhs.time == rhs.time
    }
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(time)
    }
}
