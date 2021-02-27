//
//  CtCIApp.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/16/21.
//

import SwiftUI

@main
struct CtCIApp: App {

    var message: String = Chapter5BinaryToString.test() ? "Success" : "Failed"
    
    var body: some Scene {
        WindowGroup {
            ContentView(message: message)
        }
    }
}


