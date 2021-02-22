//
//  Chapter3SetofStacks.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

class Chapter3SetofStacks {
    
    static func test() -> Bool {
        
        var stackSet = StackSet<Int>(threshold: 5)
        stackSet.push(LinkedNode(data: 1))
        stackSet.push(LinkedNode(data: 2))
        stackSet.push(LinkedNode(data: 3))
        stackSet.push(LinkedNode(data: 4))
        stackSet.push(LinkedNode(data: 5))
        stackSet.push(LinkedNode(data: 6))
        stackSet.push(LinkedNode(data: 7))
        stackSet.push(LinkedNode(data: 8))
        stackSet.push(LinkedNode(data: 9))
        stackSet.push(LinkedNode(data: 10))
        stackSet.push(LinkedNode(data: 11))
        stackSet.push(LinkedNode(data: 12))
        
        print(stackSet.stringValue)
        print("-pop-")
        while stackSet.isEmpty == false {
            _ = stackSet.pop()
            print(stackSet.stringValue)
            print("-pop-")
        }

        return true
    }
    
}

struct StackSet<T: Hashable & Comparable>: StackProtocol {

    private var stacks: [Stack<T>] = []
    private var itemCount: Int = 0
    
    private var topStackIndex: Int {
        return stacks.count - 1
    }

    let threshold: Int
    
    var isEmpty: Bool {
        return stacks.isEmpty
    }
    
    var stringValue: String {
        var result = ""
        for i in 0..<stacks.count {
            result += "stacks[\(i)]= \(stacks[i].stringValue)\r"
        }
        return result
    }
    
    init(threshold: Int) {
        self.threshold = threshold
    }

    
    func peek() -> T? {
        return stacks[topStackIndex].peek()
    }

    mutating func pop() -> T? {
        let value = stacks[topStackIndex].pop()
        if stacks[topStackIndex].isEmpty {
            stacks.remove(at: topStackIndex)
        }
        
        itemCount = itemCount > 1 ? itemCount - 1 : 0
        
        return value
    }
    
//    mutating func pop(at subStackIndex: Int) -> T? {
//        guard subStackIndex < stacks.count else {
//            return
//        }
//        let value = stacks[subStackIndex].pop()
//        return value
//    }
    
    mutating func push(_ node: LinkedNode<T>) {
        itemCount += 1
        if Double(itemCount) / Double(threshold) > Double(stacks.count) {
            stacks.append(Stack<T>())
        }
        
        stacks[topStackIndex].push(node)
    }
}
