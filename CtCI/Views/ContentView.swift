//
//  ContentView.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/16/21.
//

import SwiftUI

struct ContentView: View {
    var message: String = "Hello world!"
    
    var body: some View {
        Text(message)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
