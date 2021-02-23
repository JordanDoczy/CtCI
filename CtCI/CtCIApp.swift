//
//  CtCIApp.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/16/21.
//

import SwiftUI

@main
struct CtCIApp: App {
    
    
    var message: String = Chapter4BuildOrder.test() ? "Complete" : "Incomplete"
    
    var body: some Scene {
        WindowGroup {
//            TreeView(array: getTree())
//            LinkedListView(linkedLists: Chapter4ListofDepths.test())
            ContentView(message: message)
        }
    }
}


