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
    static func sumLists(n: LinkedNode<Int>, m: LinkedNode<Int>) -> LinkedNode<Int> {
                
        var nNode: LinkedNode<Int>? = n
        var mNode: LinkedNode<Int>? = m
        var result: LinkedNode<Int>? = nil
        var resultHead: LinkedNode<Int>? = nil
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
            let node = LinkedNode(data: value)
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
            result?.next = LinkedNode(data: 1)
        }
        
        return resultHead ?? n
    }
    
    static func test() -> Bool {
        let left = LinkedNode(data: 5)
        left.next = LinkedNode(data: 2)
        left.next!.next = LinkedNode(data: 2)
        print("left= \(left.getStringValue())")
        
        let right = LinkedNode(data: 6)
        right.next = LinkedNode(data: 7)
        right.next!.next = LinkedNode(data: 2)
        right.next!.next!.next = LinkedNode(data: 3)
        print("right= \(right.getStringValue())")
        
        let sum = sumLists(n: left, m: right)
        print("sum= \(sum.getStringValue())")
        
        return sum.getStringValue() == "1>0>5>3>"
    }
    
    
}

