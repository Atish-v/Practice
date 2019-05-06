//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var array = [1, 5, 3, 4, 1, 11, 43, 12, 5, 2, 12 ,5, 6, 8, 3 , 2]


func quickSort(_ a: inout [Int], startIndex: Int, endIndex: Int) {
    if startIndex >= endIndex {
        return
    }

    let part = partition(&a, start: startIndex, end: endIndex)
    
    let temp = a[part]
    a[part] = a[endIndex]
    a[endIndex] = temp
    
    quickSort(&a, startIndex: startIndex, endIndex: part - 1)
    quickSort(&a, startIndex: part + 1, endIndex: endIndex)
}

func partition(_ a: inout [Int], start: Int, end: Int) -> Int {
    let pivot = a[end]
    var partionIndex = start
    
    for i in start..<end {
        if a[i] <= pivot {
            let temp = a[i]
            a[i] = a[partionIndex]
            a[partionIndex] = temp
            partionIndex += 1
        }
    }
    
    return partionIndex
}


quickSort(&array, startIndex: 0, endIndex: array.count - 1)

partition(&array, start: 0, end: array.count - 1)
