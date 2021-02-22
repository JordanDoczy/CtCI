//
//  StructProtocol.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/19/21.
//

import Foundation

protocol StackProtocol {
    associatedtype T: Hashable & Comparable & Equatable

    var isEmpty: Bool { get }
    
    mutating func push(_ node: LinkedNode<T>)
    mutating func pop() -> T?
    func peek() -> T?
}
