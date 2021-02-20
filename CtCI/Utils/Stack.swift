//
//  Stack.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

struct Stack<T: Hashable & Comparable & Equatable>: StackProtocol {

    private var top: Node<T>?
    
    var isEmpty: Bool {
        return top == nil
    }
    
    var stringValue: String {
        return top?.getStringValue() ?? ""
    }
    
    func peek() -> T? {
        return top?.data
    }
    
    mutating func pop() -> T? {
        let data = top?.data
        top = top?.next
        return data
    }
    
    mutating func push(_ node: Node<T>) {
        let next = top
        top = node
        top!.next = next
    }
}
