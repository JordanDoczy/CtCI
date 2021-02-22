//
//  Queue.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

struct Queue<T: Hashable & Comparable & Equatable>: QueueProtocol {
    
    private var first: LinkedNode<T>?
    private var last: LinkedNode<T>?
    
    var isEmpty: Bool {
        return first == nil
    }
    
    var stringValue: String {
        return first?.getStringValue() ?? ""
    }
    
    mutating func add(_ node: LinkedNode<T>) {
        if first == nil {
            first = node
        }
        last?.next = node
        last = node
    }
    
    mutating func remove() -> T? {
        let data = first?.data
        first = first?.next
        if first == nil {
            last = nil
        }
        return data
    }
    
    func peek() -> T? {
        return first?.data
    }
}
