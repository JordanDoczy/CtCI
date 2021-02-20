//
//  Chapter2DeleteMiddleNode.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2DeleteMiddleNode {

    static func deleteMiddleNode(_ node: Node<Int>) {

        guard let next = node.next else {
            return
        }

        node.data = next.data
        node.next = next.next
    }
    
    // 0>1>2>3>4>5> (nodelist)
    // 0>1>2>4>5> (node 3 passed in)
    static func test() -> Bool {
        let listNode = Node(data: 0)
        listNode.next = Node(data: 1)
        listNode.next!.next = Node(data: 2)
        listNode.next!.next!.next = Node(data: 3)
        listNode.next!.next!.next!.next = Node(data: 4)
        listNode.next!.next!.next!.next!.next = Node(data: 5)
        print("listNode= \(listNode.getStringValue())")
        
        let node3 = listNode.next!.next!.next!
        
        deleteMiddleNode(node3)
        
        print("listNode= \(listNode.getStringValue())")
 
        return listNode.getStringValue() == "0>1>2>4>5>"
    }
}
