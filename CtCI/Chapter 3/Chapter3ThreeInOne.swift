//
//  Chapter3ThreeInOne.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

class Chapter3ThreeInOne {
    
    
    static func threeInOne() {
        
        var s = Stack<Int>()
        s.push(LinkedNode(data: 1))
        s.push(LinkedNode(data: 2))
        s.push(LinkedNode(data: 3))
        s.push(LinkedNode(data: 4))
        s.push(LinkedNode(data: 5))
        print(s.stringValue)
  
        while s.isEmpty == false {
            if let value = s.pop() {
                print(value, s.stringValue)
            } else {
                print("-", s.stringValue)
            }
        }
        
        var q = Queue<Int>()
        q.add(LinkedNode(data: 1))
        q.add(LinkedNode(data: 2))
        q.add(LinkedNode(data: 3))
        q.add(LinkedNode(data: 4))
        q.add(LinkedNode(data: 5))
        print(q.stringValue)
        
        while q.isEmpty == false {
            if let value = q.remove() {
                print(value, q.stringValue)
            } else {
                print("-", q.stringValue)
            }
        }
    }
    
    static func test() -> Bool {
        
        threeInOne()
        
        return false
    }
    
}
