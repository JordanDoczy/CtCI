//
//  Chapter4RouteBetweenNodes.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/20/21.
//

import Foundation

class Chapter4RouteBetweenNodes {
    
    static func isRoute<T>(graph: Graph<T>, from: GraphNode<T>, to: GraphNode<T>) -> Bool {

        defer {
            for node in graph.nodes {
                node.searched = false
            }
        }
        
        guard graph.nodes.contains(where: { $0.data == from.data }) && graph.nodes.contains(where: { $0.data == to.data }) else {
            return false
        }
  
        for child in from.children {
            if !child.searched { // dont search children that have already been searched
                child.searched = true
                if child == to { // if we found the child return true
                    return true
                }
                if isRoute(graph: graph, from: child, to: to) { // otherwise see if a grandchild matches
                    return true
                }
            }
        }
        
        return false
    }
    

    static func test() -> Bool {
        
        let n0 = GraphNode(data: 0)
        let n1 = GraphNode(data: 1)
        let n2 = GraphNode(data: 2)
        let n3 = GraphNode(data: 3)
        let n4 = GraphNode(data: 4)
        let n5 = GraphNode(data: 5)
        let n6 = GraphNode(data: 6)
        
        n0.addChild(n1)
        n1.addChild(n2)
        n2.addChild(n0)
        n2.addChild(n3)
//        n3.addChild(n0)
        
        n4.addChild(n6)
        n5.addChild(n4)
        n6.addChild(n5)
        
        let g = Graph<Int>()
        g.addNode(n0)
        g.addNode(n1)
        g.addNode(n2)
        g.addNode(n3)
        g.addNode(n4)
        g.addNode(n5)
        g.addNode(n6)
        
//        let n100 = GraphNode(data: 100)
        
        return isRoute(graph: g, from: n6, to: n4) == true
        
    }
    
}

