//: [Previous](@previous)

import Foundation

/**
 **Rotate a 3D Array by 90 degree
 **/


/// Prints an Array in matrix form
///
/// - Parameter array: array to be printed
/// - Returns: String representing Matrix
func printArray(array: [[Int]]) -> String {
    var string = ""
    let count = array.count
    for i in 0..<count {
        if i != 0 {
            string.append("\n")
            
        }
        for j in 0..<count {
            if j != 0 {
                string.append("\t")
            }
            string.append("\(array[i][j])")
        }
    }
    return string
}


func rotate(_ matrix: inout [[Int]]) {
    printArray(array: matrix)
    let count = matrix.count
    for i in 0..<count {
        for j in i+1..<count {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
    
    printArray(array: matrix)
    
    for i in 0..<count {
        for j in 0..<count/2 {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[i][count-1-j]
            matrix[i][count-1-j] = temp
        }
    }
    
    printArray(array: matrix)
}

//Example
var matrix = [[ 1,2,3 ], [4,5,6], [7,8,9]]
rotate(&matrix)


[
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
]


[7, 4, 1]
[8, 5, 2]
[9, 6, 3]


[1, 4, 7]
[2, 5, 8]
[3, 6, 9]
