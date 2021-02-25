//
//  CtCIApp.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/16/21.
//

import SwiftUI

@main
struct CtCIApp: App {
    
    
    
    var message: String = Chapter4PathsWithSum.test() ? "Complete" : "Incomplete"
    
    func getArray() -> [[Int?]] {
        let tree = Chapter4PathsWithSum.getTree()
        return tree.getValuesBFS()
    }
    
    var body: some Scene {
        WindowGroup {
            TreeView(array: getArray())
//            ContentView(message: message)
        }
    }
}


