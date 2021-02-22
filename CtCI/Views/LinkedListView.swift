//
//  LinkedListView.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/22/21.
//

import SwiftUI

struct LinkedListView: View {
    
    let linkedLists: [LinkedNode<Int>?]
    var spacer: CGFloat = 150.0
    
    var body: some View {
        VStack{
            ForEach(linkedLists.indices) { i in
                HStack {
                    let str = linkedLists[i] != nil ? "\(linkedLists[i]!.stringValue)" : "-"
                    Text("\(str)")
                    Spacer()
                }
                .padding()
            }
        }
        .font(.custom("System", size: 20))
    }
}

struct LinkedListView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedListView(linkedLists: Chapter4ListofDepths.test())
    }
}
