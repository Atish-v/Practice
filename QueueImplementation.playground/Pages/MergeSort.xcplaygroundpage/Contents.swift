//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)




func merge(a: [Int], b: [Int], into result: inout [Int]) {
    var i = 0
    var j = 0
    var k = 0
    
    let aCount = a.count
    let bCount = b.count
    
    while (i < aCount && j < bCount && k < (aCount + bCount)) {
        if a[i] <= b[j] {
            result[k] = (a[i])
            i += 1
        } else {
            result[k] = (b[j])
            j += 1
        }
        
        k += 1
    }
    
    while i < aCount {
        result[k] = a[i]
        k += 1
        i += 1
    }
    
    while j < bCount {
        result[k] = b[j]
        k += 1
        j += 1
    }
}

var result = [Int]()
result.reserveCapacity(10)




func mergeSort(_ a: inout [Int]) {
    let aCount = a.count
    if aCount == 1 {
        return
    }
    
    let mid = aCount / 2
    
    var left = Array(a[0..<mid])
    var right = Array(a[mid..<aCount])
    
    mergeSort(&left)
    mergeSort(&right)
    
    merge(a: Array(left), b: Array(right), into: &a)
}

var a = [2,1, 2, 4, 6, 2, 6, 2, 7, 1, 2]
mergeSort(&a)
print(a)
