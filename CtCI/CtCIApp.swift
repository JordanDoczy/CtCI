//
//  CtCIApp.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/16/21.
//

import SwiftUI

@main
struct CtCIApp: App {
    var body: some Scene {
        WindowGroup {
//            TreeView(array: Chapter4MinimalTree.test())
            LinkedListView(linkedLists: Chapter4ListofDepths.test())
        }
    }
}


