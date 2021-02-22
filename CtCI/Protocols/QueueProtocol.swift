//
//  QueueProtocol.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

protocol QueueProtocol {
    associatedtype T: Hashable & Comparable & Equatable
    
    var isEmpty: Bool { get }
    mutating func add(_ node: LinkedNode<T>)
    mutating func remove() -> T?
    func peek() -> T?
}
