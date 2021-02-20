//
//  Chapter3StackMin.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

class Chapter3StackMin {
    
    static func test() -> Bool {
        
        var s = StackWithMin<Int>()
        s.push(Node(data: 10))
        s.push(Node(data: 1))
        s.push(Node(data: 12))
        s.push(Node(data: 8))
        s.push(Node(data: 10))
        s.push(Node(data: 9))
        s.push(Node(data: 2))
        s.push(Node(data: 3))
        
//        while s.isEmpty == false {
//            _ = s.pop()
//            print (s.stringValue)
//            print (s.minimum)
//        }
        
        return s.minimum == 1
    }
    
    
}

struct StackWithMin<T: Hashable & Comparable>: StackProtocol {

    private var values = Stack<T>()
    private var minValues = Stack<T>()

    var stringValue: String {
        return values.stringValue
    }
    
    var stringValueMin: String {
        return minValues.stringValue
    }
    
    var minimum: T? {
        return minValues.peek()
    }
    
    var isEmpty: Bool {
        return values.isEmpty
    }
    
    func peek() -> T? {
        return values.peek()
    }

    mutating func pop() -> T? {
        let value = values.pop()
        if let unwrappedValue = value, unwrappedValue == minimum {
            _ = minValues.pop()
        }

        return value
    }
    
    mutating func push(_ node: Node<T>) {
        if minValues.isEmpty {
            minValues.push(node)
        }
        
        values.push(node)
        
        if(node.data < minimum!) {
            let copy = Node(data: node.data)
            minValues.push(copy)
        }
    }
    
    
}
