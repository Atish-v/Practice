//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

func bubbleSort(_ a: inout [Int]) {
    var aCount = a.count
    
    for i in 0..<aCount {
        for j in 0..<(aCount - i - 1) {
            if a[j] > a[j + 1] {
                let temp = a[j]
                a[j] = a[j + 1]
                a[j + 1] = temp
            }
        }
    }
}

var array = [1, 2, 4, 6, 2, 4, 2, 5, 1]

bubbleSort(&array)
print(array)
