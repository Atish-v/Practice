//Re
//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// reverse a string

let text1 = "This is Atish"

func reverse(string: String) {
    helper(index: 0, text: string)
}

func helper(index: Int, text: String) {
    if index >= text.count || text.isEmpty {
        return
    }
    helper(index: index + 1, text: text)
    print(Array(text)[index])
}



// Input: ["H","a","n","n","a","h"]
// Output: ["h","a","n","n","a","H"]

func reverseString(_ s: inout [Character]) {
    helper(start: 0, end: s.count - 1, chars: &s)
}

func helper(start: Int, end: Int, chars: inout [Character]) {
    if start == end || start > end || chars.isEmpty {
        return
    }
    
    helper(start: start + 1, end: end - 1, chars: &chars)
    
    let temp = chars[start]
    chars[start] = chars[end]
    chars[end] = temp
}

var chars: [Character] = ["H","a","n","n","a","h"]
reverseString(&chars)


//Given a linked list, swap every two adjacent nodes and return its head.
//
//You may not modify the values in the list's nodes, only nodes itself may be changed.
//
//
//
//Example:
//
//Given 1->2->3->4, you should return the list as 2->1->4->3.


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func swapPairs(_ head: ListNode?) -> ListNode? {
    let first = head?.next
    let second = head
    let temp = first?.next
    
    if first == nil || second == nil {
        return second
    }
    
    first?.next = second
    second?.next = swapPairs(temp)
    
    return first
}

let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l4 = ListNode(4)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = nil

swapPairs(l1)
print("\(l1)")




extension String.StringInterpolation {
    public mutating func appendInterpolation(head: ListNode?) {
        var head = head
        var text = ""
        while head != nil {
            text.append("\(head!.val)")
            text.append("->")
            head = head?.next
        }
        
        appendLiteral(text)
    }
}

//Given a non-negative integer numRows, generate the first numRows of Pascal's
//In Pascal's triangle, each number is the sum of the two numbers directly above it.

//0                   1
//1               1       1
//2           1       2       1
//3        1      3        3       1
//4     1      4      6        4        1

func preparePascalTriangle(depth: Int) -> [[Int]] {
    var result = [[Int]]()
    for i in 0..<depth {
        var temp: [Int] = []
        for j in 0..<(i + 1) {
            if j == 0 || j == i {
                temp.append(1)
            } else if i > 1 {
                let new = result[i - 1][j - 1] + result[i - 1][j]
                temp.append(new)
            }
        }
        result.append(temp)
    }
    return result
}

preparePascalTriangle(depth: 5)



//Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.

//Note that the row index starts from 0.

//Less efficient way
func element(at row: Int, column: Int) -> Int {
    if column == 0 || row == column {
        return 1
    } else if row > 1 {
        return element(at: row - 1, column: column - 1) + element(at: row - 1, column: column)
    }
    return 1
}

var rowArray = [Int]()

let rowNum = 4
for i in 0..<5 {
        let item = element(at: 4, column: i)
        rowArray.append(item)
}

print(rowArray)

element(at: 2, column: 0)




//Efficient solution
func row(at index: Int) -> [Int] {
    if index == 0 {
        return [1]
    }
    
    if index == 1 {
        return [1, 1]
    }
    
    var result = [Int]()
    let previousRow = row(at: index - 1)
    result[0] = 1
    for i in 1..<index {
        let element = previousRow[i-1] + previousRow[i]
        result.append(element)
    }
    result[index] = 1
    
    return result
}


//            1
//        2       3
//    4       5       6
// 7      8       1       10

func minimumTotal(_ triangle: [[Int]]) -> Int {
    var minimum: Int = 0
    for i in 1..<triangle.count - 1 {
        if i == 0 {
            minimum = triangle[0][0]
        }
        let nextRow = triangle[i + 1]
        minimum += min(nextRow[i], nextRow[i + 1] )
    }
    
    return minimum
}



//[0, 0, 0] [0, 0, 1] [0, 1, 1] [0, 1, 2]

[1]
[3, 2]

2
[5, 4, 6]
