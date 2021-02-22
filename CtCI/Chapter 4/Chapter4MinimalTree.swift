//
//  Chapter4MinimalTree.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/20/21.
//

import Foundation

class Chapter4MinimalTree {
    
    static func createMinimalTree<T>(_ list: [T]) -> TreeNode<T>? {
        
        if list.count <= 1 {
            return list.count > 0 ? TreeNode(data: list[0]) : nil
        }
        
        let count = list.count
        let half = count/2
        let result = TreeNode(data: list[half])
        result.left = createMinimalTree(Array(list[0..<half]))
        result.right = createMinimalTree(Array(list[half+1..<count]))
        return result
    }
    
    static func test() -> [[Int?]] {
        let data = [0,1,2,3,4,5,6,7,8,9,10]
        let tree: TreeNode<Int>? = createMinimalTree(data)
        TreeNode<Int>.printNodeDepthFirst(tree, prefix: "root: ")
        let values = TreeNode<Int>.getValuesBreadthFirst(nodes: [tree])
        print(values)
        return values
    }
    
}
