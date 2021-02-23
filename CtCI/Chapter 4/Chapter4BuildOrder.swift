//
//  Chapter4BuildOrder.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/23/21.
//

import Foundation

class Chapter4BuildOrder {
    
    private var builtNodes: [GraphNode<String>:Bool] = [:]
    private(set) var buildOrder: [GraphNode<String>] = []

    func addNodeToBuilt(node: GraphNode<String>) {
        guard isBuilt(node: node) == false else {
            return
        }
        
        builtNodes[node] = true
        buildOrder.append(node)
    }
    
    func isBuilt(node: GraphNode<String>) -> Bool {
        return builtNodes[node] == true
    }
    
    func addNodesToBuildOrder(from graph: Graph<String>) throws {
        for node in graph.nodes {
            print("node= \(node.data)")
            try setBuildOrderForNode(node)
        }
    }
    
    func setBuildOrderForNode(_ node: GraphNode<String>, compareNode: GraphNode<String>?=nil) throws {
        if node.children.isEmpty {
            addNodeToBuilt(node: node)
        } else {
            
            let compare = compareNode != nil ? compareNode : node
            
            for child in node.children {
                if child.hasLoop() { 
                    throw NSError(domain: "No valid build, dependency loop for child \(child.data)", code: 1)
                }
                if !isBuilt(node: node) {
                    try setBuildOrderForNode(child, compareNode: compare)
                }
            }
            
            addNodeToBuilt(node: node)
            
        }
    }
 
    static func test() -> Bool {
        let buildOrder = Chapter4BuildOrder()
        do {
            try buildOrder.addNodesToBuildOrder(from: buildGraph())
        } catch let error {
            print (error)
        }
        
        print(buildOrder.buildOrder.map { $0.data })
        
        return true
    }
    
    static func buildGraph() -> Graph<String> {
        let a = GraphNode(data: "a")
        let b = GraphNode(data: "b")
        let c = GraphNode(data: "c")
        let d = GraphNode(data: "d")
        let e = GraphNode(data: "e")
        let f = GraphNode(data: "f")
        let g = GraphNode(data: "g")
        
        a.addChild(b)
        a.addChild(c)
        a.addChild(f)

        b.addChild(f)
        c.addChild(f)

        g.addChild(d)

        e.addChild(a)
        e.addChild(b)
        
        let graph = Graph<String>()
        graph.addNode(a)
        graph.addNode(b)
        graph.addNode(c)
        graph.addNode(d)
        graph.addNode(e)
        graph.addNode(f)
        graph.addNode(g)
        
        return graph
    }
}
