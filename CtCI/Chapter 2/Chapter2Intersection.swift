//
//  Chapter2Intersection.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/18/21.
//

import Foundation

class Chapter2Intersection {
    
    static func isIntersection(a: LinkedNode<Int>, b: LinkedNode<Int>) -> LinkedNode<Int>? {
        
        var aNode: LinkedNode<Int>? = a
        var bNode: LinkedNode<Int>? = b
        
        var aEnd: LinkedNode<Int>?
        var bEnd: LinkedNode<Int>?
        
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
    static func isIntersectionBruteForce(a: LinkedNode<Int>, b: LinkedNode<Int>) -> LinkedNode<Int>? {
        
        var aItems: [LinkedNode<Int>] = []
        var bItems: [LinkedNode<Int>] = []
        
        var aNode: LinkedNode<Int>? = a
        while aNode != nil { // O(a)
            aItems.append(aNode!)
            aNode = aNode?.next
        }
        
        var bNode: LinkedNode<Int>? = b
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
    static func isIntersectionHash(a: LinkedNode<Int>, b: LinkedNode<Int>) -> LinkedNode<Int>? {
        
        var aItems: [LinkedNode<Int>:Int] = [:]
        
        var aNode: LinkedNode<Int>? = a
        while aNode != nil {
            aItems[aNode!] = 1
            aNode = aNode?.next
        }
        
        var bNode: LinkedNode<Int>? = b
        while bNode != nil {
            if aItems[bNode!] != nil {
                return bNode
            }
            bNode = bNode?.next
        }
        
        return nil
    }
    
    static func test() -> Bool {
        let intersect = LinkedNode(data: -99)
        intersect.next = LinkedNode(data: -100)
        intersect.next!.next = LinkedNode(data: -101)
        
        let a = LinkedNode(data: 0)
        a.next = LinkedNode(data: 1)
        a.next!.next = LinkedNode(data: 2)
        a.next!.next!.next = intersect
        print("a= \(a.getStringValue(useTime: false))")
        
        let b = LinkedNode(data: 9)
        b.next = LinkedNode(data: 10)
        b.next!.next = LinkedNode(data: 11)
        b.next!.next!.next = LinkedNode(data: 12)
        b.next!.next!.next!.next = LinkedNode(data: 13)
        b.next!.next!.next!.next!.next = intersect
        print("b= \(b.getStringValue(useTime: false))")
        
        return isIntersection(a: a, b: b) == intersect
    }
}
