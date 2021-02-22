//
//  Chapter2RemoveDuplicates.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2RemoveDuplicates {
    
    static func removeDuplicates(from node: LinkedNode<Int>) -> LinkedNode<Int> {

        var map:[Int:Bool] = [:]
        var current: LinkedNode<Int>? = node
        var previous: LinkedNode<Int>? = current
        
        while current != nil {
            if map[current!.data] == nil {
                map[current!.data] = true
                previous = current
            } else {
                previous?.next = current!.next
            }
            current = current?.next
        }
        
        return node
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

        let resultNode = LinkedNode(data: 0)
        resultNode.next = LinkedNode(data: 1)
        resultNode.next!.next = LinkedNode(data: 2)
        resultNode.next!.next!.next = LinkedNode(data: 3)
        resultNode.next!.next!.next!.next = LinkedNode(data: 4)
        resultNode.next!.next!.next!.next!.next = LinkedNode(data: 5)
        print("resultNode= \(resultNode.getStringValue())")
        
        let removeDups = Chapter2RemoveDuplicates.removeDuplicates(from: listNode)
        print("removeDups= \(removeDups.getStringValue())")
        
        return removeDups == resultNode
    }

}
