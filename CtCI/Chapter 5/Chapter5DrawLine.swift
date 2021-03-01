//
//  Chapter5DrawLine.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/28/21.
//

import Foundation

class Chapter5DrawLine {
    
    static func drawLine(screen: [UInt8], width: Int, x1: Int, x2: Int, y: Int) -> [UInt8] {

        var screen = screen
        
        let intsPerRow = width / UInt8.bitWidth

        let rowStartIndex = x1 / UInt8.bitWidth
        let rowEndIndex = x2 / UInt8.bitWidth

        let screenIndex = intsPerRow * y + rowStartIndex
        let screenRange = screenIndex...screenIndex+rowEndIndex

        let columnStart = x1 % UInt8.bitWidth
        let columnEnd = x2 % UInt8.bitWidth - (UInt8.bitWidth - 1)
        
        for i in screenRange {
            var pixels = UInt8.max
            pixels >>= i == screenRange.lowerBound ? columnStart : 0
            pixels <<= i == screenRange.upperBound ? columnEnd : 0
            screen[i] = pixels
        }
        
        // 0b00000000 0b00111111 0b11000000
        
        //print(indexRange)

        return screen
    }
    
    static func runTest() -> Bool {
        var screen: [UInt8] = []
        screen.append(0b0);  screen.append(0b0);  screen.append(0b0);
        screen.append(0b0);  screen.append(0b0);  screen.append(0b0);
        screen.append(0b0);  screen.append(0b0);  screen.append(0b0);
        screen.append(0b0);  screen.append(0b0);  screen.append(0b0);
        screen.append(0b0);  screen.append(0b0);  screen.append(0b0);
        
        let width = UInt8.bitWidth * 3
        
        let result = drawLine(screen: screen, width: width, x1: 2, x2: 14, y: 1)
        
        let resultString = result.map { String($0, radix: 2) }
        for i in stride(from: 0, to: result.count, by: 3) {
            print (resultString[i], resultString[i+1], resultString[i+2])
        }
        
        return result == [0, 0, 0, 63, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    
}
