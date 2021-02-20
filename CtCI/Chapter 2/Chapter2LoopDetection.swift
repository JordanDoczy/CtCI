//
//  Chapter2LoopDetection.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2LoopDetection {

    static func hasLoopHash(_ node: Node<Int>) -> Node<Int>? {
        
        var map: [Node<Int>:Int] = [:]
        var n: Node<Int>? = node
        
        while n != nil {
            if map[n!] != nil {
                return n
            }
            map[n!] = 1
            n = n!.next
        }

        return nil
    }
    
    static func hasLoop(_ node: Node<Int>) -> Node<Int>? {
        
        var slow: Node<Int>? = node
        var fast: Node<Int>? = node
        
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

        let item0 = Node(data: 0)
        let item1 = Node(data: 1)
        let item2 = Node(data: 2)
        let item3 = Node(data: 3)
        let item4 = Node(data: 4)
        let item5 = Node(data: 5)
        
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
