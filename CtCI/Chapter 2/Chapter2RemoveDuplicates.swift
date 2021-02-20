//
//  Chapter2RemoveDuplicates.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2RemoveDuplicates {
    
    static func removeDuplicates(from node: Node<Int>) -> Node<Int> {

        var map:[Int:Bool] = [:]
        var current: Node<Int>? = node
        var previous: Node<Int>? = current
        
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

        let listNode = Node(data: 0)
        listNode.next = Node(data: 1)
        listNode.next!.next = Node(data: 2)
        listNode.next!.next!.next = Node(data: 3)
        listNode.next!.next!.next!.next = Node(data: 4)
        listNode.next!.next!.next!.next!.next = Node(data: 3)
        listNode.next!.next!.next!.next!.next!.next = Node(data: 5)
        listNode.next!.next!.next!.next!.next!.next!.next = Node(data: 5)
        listNode.next!.next!.next!.next!.next!.next!.next!.next = Node(data: 0)
        print("listNode= \(listNode.getStringValue())")

        let resultNode = Node(data: 0)
        resultNode.next = Node(data: 1)
        resultNode.next!.next = Node(data: 2)
        resultNode.next!.next!.next = Node(data: 3)
        resultNode.next!.next!.next!.next = Node(data: 4)
        resultNode.next!.next!.next!.next!.next = Node(data: 5)
        print("resultNode= \(resultNode.getStringValue())")
        
        let removeDups = Chapter2RemoveDuplicates.removeDuplicates(from: listNode)
        print("removeDups= \(removeDups.getStringValue())")
        
        return removeDups == resultNode
    }

}
