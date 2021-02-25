//
//  Chapter4RandomNode.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/24/21.
//

import Foundation

class Chapter4RandomNode {
    
    static func getRandomNode<T>(from root: TreeNode<T>) -> TreeNode<T> {
        let randomIndex = Int.random(in: 0..<root.size) // get random index based on tree size
        return root.getNode(at: randomIndex) ?? root // find node at index
    }
    
    static func getRandomNodeSimple<T>(from root: TreeNode<T>) -> TreeNode<T> {
        let allNodes = [root] + root.getChildren() // get array of children
        return allNodes.randomElement()! // return random element
    }

    static func test() -> Bool {
        let tree = getTree()
        
        var map:[Int:Int] = [:]

        for _ in 0..<1{
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
