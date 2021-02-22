//
//  Chapter2LoopDetection.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2LoopDetection {

    static func hasLoopHash(_ node: LinkedNode<Int>) -> LinkedNode<Int>? {
        
        var map: [LinkedNode<Int>:Int] = [:]
        var n: LinkedNode<Int>? = node
        
        while n != nil {
            if map[n!] != nil {
                return n
            }
            map[n!] = 1
            n = n!.next
        }

        return nil
    }
    
    static func hasLoop(_ node: LinkedNode<Int>) -> LinkedNode<Int>? {
        
        var slow: LinkedNode<Int>? = node
        var fast: LinkedNode<Int>? = node
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if fast === slow {
                break
            }
        }

        guard fast != nil && fast?.next != nil else {
            return nil
        }
        
        // return to head
        slow = node
        
        // find beginning of loop9
        while slow != fast {
            slow = slow?.next
            fast = fast?.next
        }

        return fast
    }
    
    static func test() -> Bool {

        let item0 = LinkedNode(data: 0)
        let item1 = LinkedNode(data: 1)
        let item2 = LinkedNode(data: 2)
        let item3 = LinkedNode(data: 3)
        let item4 = LinkedNode(data: 4)
        let item5 = LinkedNode(data: 5)
        
        item0.next = item1
        item1.next = item2
        item2.next = item3
        item3.next = item4
        item4.next = item5
        item5.next = item2
        
        let loop = hasLoop(item0)
        
        return loop === item2
    }
    
}
