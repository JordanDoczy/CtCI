//
//  Chapter2Partition.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2Partition {


    // head / tail option
    // append lower items to the head
    // append higher items to the tail
    // combine head and tail
    static func partition(node: LinkedNode<Int>, parition: Int) -> LinkedNode<Int> {
        var head: LinkedNode<Int>? = nil
        var headNext: LinkedNode<Int>? = nil
        var tail: LinkedNode<Int>? = nil
        var tailNext: LinkedNode<Int>? = nil
        var n: LinkedNode<Int>? = node
        
        while n != nil {
            let next = n!.next
            n!.next = nil
            if n!.data < parition {
                if head == nil {
                    head = n
                    headNext = n
                } else {
                    headNext!.next = n
                    headNext = headNext!.next
                }
            } else {
                if tail == nil {
                    tail = n
                    tailNext = n
                } else {
                    tailNext!.next = n
                    tailNext = tailNext!.next
                }
            }
            n = next
        }
        
        if head == nil {
            return tail ?? node
        } else {
            headNext?.next = tail
            return head ?? node
        }
    }
    
    static func test() -> Bool {
        let listNode = LinkedNode(data: 3)
        listNode.next = LinkedNode(data: 5)
        listNode.next!.next = LinkedNode(data: 8)
        listNode.next!.next!.next = LinkedNode(data: 5)
        listNode.next!.next!.next!.next = LinkedNode(data: 10)
        listNode.next!.next!.next!.next!.next = LinkedNode(data: 2)
        listNode.next!.next!.next!.next!.next!.next = LinkedNode(data: 1)
        print("listNode= \(listNode.getStringValue())")
        
        //let partitionNode = partition(node: listNode, partition: 5)
        let partitionNode = partition(node: listNode, parition: 5)
        print("partitionNode= \(partitionNode.getStringValue())")
        
        return true
    }
    
}
