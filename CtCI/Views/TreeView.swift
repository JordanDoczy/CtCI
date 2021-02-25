//
//  TreeView.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/20/21.
//

import SwiftUI

struct TreeView: View {
    
    var spacer: CGFloat = 150.0
    
    @State var array:[[Int?]]
    @State var count = 0
    
    static func getString(from arrays:[[Int]], at count: Int) -> String {
        let values = arrays[count]
        return "\(count): \(values)"
    }
    
    var body: some View {
        VStack{
            ForEach(array.indices) { i in
                HStack (spacing: spacer / CGFloat((i+1)*i)) {
                    ForEach(array[i], id: \.self) { number in
                        let str = number != nil ? "\(number!)" : "-"
                        Text("\(str)")
                            .frame(width: 12, height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(10)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    }
                }
            }
        }
        .font(.custom("System", size: 10))
        .padding()
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView(array: Chapter4MinimalTree.test())
    }
}
