//
//  Chapter4RandomNode.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/24/21.
//

import Foundation

class Chapter4RandomNode {
    
    
    static func getRandomNode<T>(from root: TreeNode<T>) -> TreeNode<T> {
        
        var allNodes = [root]
        var nodesAtLevel = [root]

        while !nodesAtLevel.isEmpty {
            nodesAtLevel = getChildren(from: nodesAtLevel)
            allNodes += nodesAtLevel
        }
            
        return allNodes.randomElement()!
    }
    
    static func getChildren<T>(from nodes: [TreeNode<T>]) -> [TreeNode<T>] {
        
        var children: [TreeNode<T>] = []
        for node in nodes {
            if let left = node.left {
                children.append(left)
            }
            if let right = node.right {
                children.append(right)
            }
        }
        
        return children
    }
    
    static func test() -> Bool {
        let tree = getTree()
        var map:[Int:Int] = [:]

        for _ in 0..<1000{
            let randomNode = getRandomNode(from: tree)
            if map[randomNode.data] == nil {
                map[randomNode.data] = 0
            }
            map[randomNode.data]! += 1
        }
        
        let keys = map.keys.sorted()
        for key in keys {
            print ("\(key): \(map[key]!)")
        }
        
        return false
    }
    
    
    static func getTree() -> TreeNode<Int> {
        let bst = TreeNode.buildBST(from: [50,20,60,10,25,70])
        return bst!
    }
    
}
