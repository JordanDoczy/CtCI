//
//  Chapter1RotateMatrix.swift
//  CtCI
//
//  Created by Jordan Doczy on 2/17/21.
//

import Foundation

// Chapter1RotateMatrix.rotateMatrix([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]) == [[13,9,5,1],[14,10,6,2],[15,11,7,3],[16,12,8,4]]
// Chapter1RotateMatrix.rotateMatrix([[1,2,3],[4,5,6],[7,8,9]]) == [[7,4,1],[8,5,2],[9,6,3]]

class Chapter1RotateMatrix {
    
    static func rotateMatrix(_ matrix: [[Int]]) -> [[Int]] {
            
        // matrix should be nxn
        guard matrix[0].count == matrix.count else {
            return matrix
        }

        let maxRow = matrix.count-1
        var matrix = matrix // make matrix mutable
        
        print("-", matrix)

        for row in 0..<matrix.count {
            for column in 0...row {
                let temp = matrix[row][column]
                matrix[row][column] = matrix[column][maxRow-row]
                matrix[column][maxRow-row] = temp
            }
        }
        
        // clean up last column, ignore first and last rows
        let column = matrix[0].count-1
        for row in 1..<matrix.count-1 {
            let temp = matrix[row][column]
            matrix[row][column] = matrix[column][maxRow-row]
            matrix[column][maxRow-row] = temp
        }
        
        print(matrix)
        return matrix
    }
    
}
