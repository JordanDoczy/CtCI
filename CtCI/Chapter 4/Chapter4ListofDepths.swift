//
//  Chapter4ListofDepths.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/22/21.
//

import Foundation

class Chapter4ListofDepths {

    static func listOfDepths<T>(_ tree: TreeNode<T>) -> [LinkedNode<T>?] {
        return getLinkedNodesAtDepths(nodes: [tree])
    }
    
    static func getLinkedNodesAtDepths<T>(nodes: [TreeNode<T>?]) -> [LinkedNode<T>?] {
        guard nodes.count > 0 else {
            return []
        }
        
        var startNode: LinkedNode<T>?
        var headNode: LinkedNode<T>?
        var currentNode: LinkedNode<T>?
        var children: [TreeNode<T>?] = []

        for node in nodes {
            if let node = node {
                currentNode = LinkedNode(data: node.data)
                startNode = startNode == nil ? currentNode : startNode
                headNode?.next = currentNode
                headNode = currentNode
                
                if node.left != nil || node.right != nil { // grab both so we maintain correct structure
                    children.append(node.left)
                    children.append(node.right)
                }
            }
        }
    
        return [startNode] + getLinkedNodesAtDepths(nodes: children)
    }
    
    static func test() -> [LinkedNode<Int>?] {
        if let tree = Chapter4MinimalTree.createMinimalTree([0,1,2,3,4,5,6,7,8,9,10]) {
            let linkedLists: [LinkedNode<Int>?] = listOfDepths(tree)
            
            for list in linkedLists {
                print(list!.stringValue)
            }
            
            return linkedLists
        }
        
        return []
    }
    
}


