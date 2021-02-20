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
            if Chapter3AnimalShelter.test() {
            ContentView()
            }
        }
    }
}


