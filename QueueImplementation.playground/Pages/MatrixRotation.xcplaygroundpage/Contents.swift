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

//[26* 26*26    26* 26*26    26*26    26   1]




func titleToNumber(_ s: String) -> Int {
 
    let dict = createDict()

    let multiplierArray = createMultiplierArray(count: s.count)
    
    let total = runningTotal(multiplierArray, characters: Array(s), dict: dict)
    
    return total
}

func createDict() -> [Character: Int]{
    let letters: [Character] = ["A", "B","C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var dict: [Character: Int] = [:]
    for (index, c) in letters.enumerated() {
        dict[c] = index + 1
    }
    
    return dict
}

func createMultiplierArray(count: Int) -> [Int] {
    var array = [Int].init(repeating: 0, count: count)
    for i in (0..<count).reversed() {
        if i == (count - 1) {
            array[i] = 1
        } else {
            array[i] = array[i - 1] * 26
        }
    }
    
    return array
}

func runningTotal(_ multipliers: [Int], characters: [Character], dict: [Character: Int]) -> Int {
    guard multipliers.count == characters.count else { return 0 }
    var total: Int = 0
    for i in 0..<characters.count {
        total += multipliers[i] *  dict[characters[i]]!
    }
    
    return total
}


func trailingZeroes(_ n: Int) -> Int {
    var num = calculateFactorial(CLongLong(n))
    var numberOfZeros: Int = 0
    while (num % 10) == 0 {
        num = num / 10
        numberOfZeros += 1
    }
    
    return numberOfZeros
}

func calculateFactorial(_ num: CLongLong) -> CLongLong {
    if num == 1 {
        return 1
    }
 
    
    return calculateFactorial(num - 1) * num
}

trailingZeroes(25)

calculateFactorial(20)
