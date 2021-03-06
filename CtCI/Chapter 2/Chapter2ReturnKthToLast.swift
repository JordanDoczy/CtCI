//
//  Chapter2ReturnKthToLast.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2ReturnKthToLast {
    
    static func returnKthToLast(from node: LinkedNode<Int>, k: Int) -> LinkedNode<Int> {
        
        // need to know the length of the node list
        // need to stop when I hit the "kth" node
        
        
        // double pointer - O(n) time, O(1) size
        return doublePointer(from: node, k: k)

        // double traversal - O(n) time, O(1) size
        //return doubleTraversal(from: node, k: k)
    }
    
    static func doublePointer(from node: LinkedNode<Int>, k: Int) -> LinkedNode<Int> {
        
        var slow: LinkedNode<Int>? = node
        var fast: LinkedNode<Int>? = node.getNode(at: k)
        
        guard fast != nil else {
            return node
        }
        
        while fast != nil { // when fast hits the end, slow will be at the correct position
            slow = slow?.next
            fast = fast?.next
        }

        return slow ?? node
    }
    
    static func doubleTraversal(from node: LinkedNode<Int>, k: Int) -> LinkedNode<Int> {
        var n: LinkedNode<Int>? = node
        var counter = 0
        
        // iterate through the list and keep a counter
        while n != nil {
            n = n!.next
            counter += 1
        }
        
        n = node

        // iterate through a second time and stop at the "kth" node
        for _ in 0..<counter-k {
            n = n!.next
        }
        
        return n ?? node
    }
    
    static func test() -> Bool {
        
        let listNode = LinkedNode(data: 0)
        listNode.next = LinkedNode(data: 1)
        listNode.next!.next = LinkedNode(data: 2)
        listNode.next!.next!.next = LinkedNode(data: 3)
        listNode.next!.next!.next!.next = LinkedNode(data: 4)
        listNode.next!.next!.next!.next!.next = LinkedNode(data: 3)
        listNode.next!.next!.next!.next!.next!.next = LinkedNode(data: 5)
        listNode.next!.next!.next!.next!.next!.next!.next = LinkedNode(data: 5)
        listNode.next!.next!.next!.next!.next!.next!.next!.next = LinkedNode(data: 0)
        print("listNode= \(listNode.getStringValue())")
        // 0>1>2>3>4>3>5>5>0>
        
        let kToLast = Chapter2ReturnKthToLast.returnKthToLast(from: listNode, k: 2)
        print("kToLast= \(kToLast.getStringValue())")
        // 5>0>
        
        return kToLast.getStringValue() == "5>0>"

    }
    
}
