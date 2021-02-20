//
//  Chapter3QueueViaStacks.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

class Chapter3QueueViaStacks {
    
    static func test() -> Bool {
        var queue = QueueViaStacks<Int>()
        queue.add(Node(data: 0))
        queue.add(Node(data: 1))
        queue.add(Node(data: 2))
        queue.add(Node(data: 3))
        _ = queue.remove()
        queue.add(Node(data: 3))
        
        // 1>2>3>3
        while queue.isEmpty == false {
            if let data = queue.remove() {
                print(data)
            }
        }
        
        return true
    }
    
}

struct QueueViaStacks<T: Hashable & Comparable & Equatable> {

    private var stackLifo = Stack<T>()
    private var stackFifo = Stack<T>()
    
    var isEmpty: Bool {
        return stackLifo.isEmpty && stackFifo.isEmpty
    }
    
    mutating func add(_ node: Node<T>) {
        stackLifo.push(node)
    }
    
    mutating func remove() -> T? {
        guard !isEmpty else {
            return nil
        }
        
        if stackFifo.isEmpty {
            reverseStack()
        }
        
        return stackFifo.pop()
    }
    
    mutating func peek() -> T? {
        if stackFifo.isEmpty {
            reverseStack()
        }
        
        return stackFifo.peek()
    }
    
    mutating private func reverseStack() {
        while stackLifo.isEmpty == false {
            if let data = stackLifo.pop() {
                stackFifo.push(Node(data: data))
            }
        }
    }
    
}
