//
//  Chapter2Intersection.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2Intersection {
    
    static func isIntersection(a: Node<Int>, b: Node<Int>) -> Node<Int>? {
        
        var aNode: Node<Int>? = a
        var bNode: Node<Int>? = b
        
        var aEnd: Node<Int>?
        var bEnd: Node<Int>?
        
        var aLength = 0
        var bLength = 0
        
        while aNode != nil || bNode != nil { // find last nodes and lengths
            if aNode != nil {
                aEnd = aNode
                aLength += 1
            }
            if bNode != nil {
                bEnd = bNode
                bLength += 1
            }

            aNode = aNode?.next
            bNode = bNode?.next
        }
        
        guard aEnd === bEnd else { // tails must match
            return nil
        }
        
        // reset to head
        aNode = a
        bNode = b
        
        if aLength > bLength { // advance the greater of two lists by the difference
            aNode = aNode!.getNode(at: aLength-bLength)
        } else {
            bNode = bNode!.getNode(at: bLength-aLength)
        }
        
        while aNode != nil && bNode != nil {
            if aNode === bNode {
                return aNode
            }
            aNode = aNode?.next
            bNode = bNode?.next
        }
        
        return nil
    }
    
    
    // time = O(a*b), space = O(a+b)
    static func isIntersectionBruteForce(a: Node<Int>, b: Node<Int>) -> Node<Int>? {
        
        var aItems: [Node<Int>] = []
        var bItems: [Node<Int>] = []
        
        var aNode: Node<Int>? = a
        while aNode != nil { // O(a)
            aItems.append(aNode!)
            aNode = aNode?.next
        }
        
        var bNode: Node<Int>? = b
        while bNode != nil { // O(b)
            bItems.append(bNode!)
            bNode = bNode?.next
        }
        
        for aNode in aItems { // O(a*b)
            for bNode in bItems {
                if aNode === bNode {
                    return aNode
                }
            }
        }
        
        return nil
    }
    
    // time = O(a+b), space = O(a)
    static func isIntersectionHash(a: Node<Int>, b: Node<Int>) -> Node<Int>? {
        
        var aItems: [Node<Int>:Int] = [:]
        
        var aNode: Node<Int>? = a
        while aNode != nil {
            aItems[aNode!] = 1
            aNode = aNode?.next
        }
        
        var bNode: Node<Int>? = b
        while bNode != nil {
            if aItems[bNode!] != nil {
                return bNode
            }
            bNode = bNode?.next
        }
        
        return nil
    }
    
    static func test() -> Bool {
        let intersect = Node(data: -99)
        intersect.next = Node(data: -100)
        intersect.next!.next = Node(data: -101)
        
        let a = Node(data: 0)
        a.next = Node(data: 1)
        a.next!.next = Node(data: 2)
        a.next!.next!.next = intersect
        print("a= \(a.getStringValue(useTime: false))")
        
        let b = Node(data: 9)
        b.next = Node(data: 10)
        b.next!.next = Node(data: 11)
        b.next!.next!.next = Node(data: 12)
        b.next!.next!.next!.next = Node(data: 13)
        b.next!.next!.next!.next!.next = intersect
        print("b= \(b.getStringValue(useTime: false))")
        
        return isIntersection(a: a, b: b) == intersect
    }
}
