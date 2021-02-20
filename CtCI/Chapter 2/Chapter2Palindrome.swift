//
//  Chapter2Palindrome.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2Palindrome {
    
    static func isPalindrome(node: Node<Int>) -> Bool {
        
        // double pointer
        // advance one pointer at twice the speed, this will leave the slow pointer at the midpoint
        // reverse the nodes from the slow pointer
        // reset fast back to head
        // step through the nodes and check that they match
        
        var slow: Node<Int>? = node
        var fast: Node<Int>? = node

        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        var reversed: Node<Int>? = reverseList2(slow!)

        fast = node // return fast to the head
        
        while reversed != nil {
            if reversed!.data != fast!.data {
                return false
            }
            
            reversed = reversed!.next
            fast = fast!.next
        }

        return true
    }

    static func reverseList(_ head: Node<Int>, previousNode: Node<Int>? = nil) ->Node<Int> {
        let nextNode = head.next
        head.next = previousNode
        if nextNode != nil {
            return reverseList(nextNode!, previousNode: head)
        }
        return head
    }
    
    static func reverseList2(_ node: Node<Int>) -> Node<Int> {
        var previous: Node<Int>?
        var current: Node<Int>? = node
        
        while current != nil {
            let next = current!.next
            current!.next = previous
            previous = current
            current = next
        }
 
        return previous ?? node
    }
    
    static func test() -> Bool {
        let listNode = Node(data: 0)
        listNode.next = Node(data: 1)
        listNode.next!.next = Node(data: 2)
        listNode.next!.next!.next = Node(data: 3)
        listNode.next!.next!.next!.next = Node(data: 2)
        listNode.next!.next!.next!.next!.next = Node(data: 1)
        listNode.next!.next!.next!.next!.next!.next = Node(data: 0)
        print("listNode= \(listNode.getStringValue())")

        return isPalindrome(node: listNode)
    }
    
}
