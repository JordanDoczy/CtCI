//
//  Chapter3SortedStack.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

class Chapter3SortedStack {
    
    static func test() -> Bool {
        
        var s = SortedStack<Int>()
        s.push(LinkedNode(data: 0))
        s.push(LinkedNode(data: 1))
        s.push(LinkedNode(data: 5))
        s.push(LinkedNode(data: 3))
        s.push(LinkedNode(data: 2))
        s.push(LinkedNode(data: 4))
        print(s.stringValue)

        return s.stringValue == "0>1>2>3>4>5>"
    }
    
}

struct SortedStack<T: Hashable & Comparable & Equatable>: StackProtocol {
    
    var stack = Stack<T>()
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var stringValue: String {
        return stack.stringValue
    }
    
    mutating func push(_ node: LinkedNode<T>) {
        if isEmpty {
            stack.push(node)
        } else if let minimum = peek(), node.data <= minimum  {
            stack.push(node)
        } else {
            insert(node)
        }
    }
    
    mutating func pop() -> T? {
        return stack.pop()
    }
    
    func peek() -> T? {
        return stack.peek()
    }
    
    private mutating func insert(_ node: LinkedNode<T>) {
        guard var value = peek() else {
            push(node)
            return
        }
        
        var tempStack = Stack<T>()

        // find the correct index
        while node.data > value && !isEmpty {
            if let v = pop() {
                tempStack.push(LinkedNode(data: v))
                value = v
            } else {
                break
            }
        }
        
        // insert node
        push(node)
        
        // add nodes back on top
        while !tempStack.isEmpty {
            if let value = tempStack.pop() {
                push(LinkedNode(data: value))
            }
        }
        
    }
    
    
}
