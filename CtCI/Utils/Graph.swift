//
//  Graph.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/20/21.
//

import Foundation

class Graph<T: Hashable & Comparable & Equatable> {
    private(set) var nodes: [GraphNode<T>] = []
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func addNode(_ node: GraphNode<T>) {
        nodes.append(node)
    }
}
