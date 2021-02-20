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
    static func partition(node: Node<Int>, parition: Int) -> Node<Int> {
        var head: Node<Int>? = nil
        var headNext: Node<Int>? = nil
        var tail: Node<Int>? = nil
        var tailNext: Node<Int>? = nil
        var n: Node<Int>? = node
        
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
        let listNode = Node(data: 3)
        listNode.next = Node(data: 5)
        listNode.next!.next = Node(data: 8)
        listNode.next!.next!.next = Node(data: 5)
        listNode.next!.next!.next!.next = Node(data: 10)
        listNode.next!.next!.next!.next!.next = Node(data: 2)
        listNode.next!.next!.next!.next!.next!.next = Node(data: 1)
        print("listNode= \(listNode.getStringValue())")
        
        //let partitionNode = partition(node: listNode, partition: 5)
        let partitionNode = partition(node: listNode, parition: 5)
        print("partitionNode= \(partitionNode.getStringValue())")
        
        return true
    }
    
}
