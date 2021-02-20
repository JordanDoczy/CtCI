//
//  Chapter2SumLists.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2SumLists {
    
    
    // lists represent numbers in reverse order
    // ex: 7>1>6 == 617
    // ex: n = 7>1>6, m = 5>9>2, returns: >2>1>9
    

    // traverse list n and m simultaneously until both end
    // at each step add the values of the items together
    // append result to a new list
    
    //5>2>2 (225)
    //6>7>2 (276)
    //result (501)
    
    // 5+6 == 11, split into 1,1
    // list = 1>
    // 2+7+(1) == 10, split into 1,0
    // list = 1>0
    // 2+2+1 = 5
    // list = 1>0>5
    static func sumLists(n: Node<Int>, m: Node<Int>) -> Node<Int> {
                
        var nNode: Node<Int>? = n
        var mNode: Node<Int>? = m
        var result: Node<Int>? = nil
        var resultHead: Node<Int>? = nil
        var remainder = 0
        
        while nNode != nil || mNode != nil {
            let nVal = nNode?.data ?? 0
            let mVal = mNode?.data ?? 0
            var value = nVal + mVal + remainder
            remainder = 0
            if value >= 10 {
                value -= 10
                remainder = 1
            }
            let node = Node(data: value)
            if result == nil {
                result = node
                resultHead = node
            } else {
                result!.next = node
                result = node
            }
            
            nNode = nNode?.next
            mNode = mNode?.next
        }

        if remainder == 1 {
            result?.next = Node(data: 1)
        }
        
        return resultHead ?? n
    }
    
    static func test() -> Bool {
        let left = Node(data: 5)
        left.next = Node(data: 2)
        left.next!.next = Node(data: 2)
        print("left= \(left.getStringValue())")
        
        let right = Node(data: 6)
        right.next = Node(data: 7)
        right.next!.next = Node(data: 2)
        right.next!.next!.next = Node(data: 3)
        print("right= \(right.getStringValue())")
        
        let sum = sumLists(n: left, m: right)
        print("sum= \(sum.getStringValue())")
        
        return sum.getStringValue() == "1>0>5>3>"
    }
    
    
}

