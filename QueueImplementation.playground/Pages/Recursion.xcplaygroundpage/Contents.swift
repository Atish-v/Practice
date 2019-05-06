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
//reverseString(&chars)


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

//swapPairs(l1)
//print("\(l1)")




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

//preparePascalTriangle(depth: 5)



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

//print(rowArray)

//element(at: 2, column: 0)




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


//find the minimum total on path from top to bottom. element below it or adjacent in the below row can only be included in path
//            1
//        2       3
//    4       5       6
// 7      8       1       10

func minimumTotal(_ triangle: inout [[Int]]) -> Int {
    guard triangle.isEmpty == false else {
        return 0
    }
    let count = triangle.count
    for i in (1...(count - 1)).reversed() {
        for j in 0..<i{
            if triangle[i][j] < triangle[i][j+1] {
                triangle[i - 1][j] += triangle[i][j]
            } else {
                triangle[i - 1][j] += triangle[i][j + 1]
            }
        }
    }
    return triangle[0][0]
}



//[0, 0, 0] [0, 0, 1] [0, 1, 1] [0, 1, 2]
var triangle = [
[1],
[3, 2],
[5, 4, 6],
]

let sum = minimumTotal(&triangle)
//print(triangle)

//{1, 2, 3, 4, 5}



[ 1, 2, 3, 4, 5, 6,]

[1, 2, 3]


(0-3+6)%6


func leftRotateArray(_ array: inout [Int],by position: Int) {
    let count = array.count
    var temp = [Int]()
    temp.reserveCapacity(position)
    for i in 0..<count {
        if i < position {
            temp.append(array[i])
        } else {
            array[i-position] = array[i]
        }
    }

    var tempIndex = (0 - position + count) % count

    for i in 0..<temp.count {
        array[tempIndex] = temp[i]
        tempIndex += 1
    }

}


var array = [1,2, 3, 4, 5, 6]

//leftRotateArray(&array, by: 5)
//print(array)


//Print all the subsets of an array
//e.g [1,2] -> {}, {1}, {}


var int = 0

func findSubsets(_ a: [Int]) {
    var subset = [Int?](repeating: nil, count: a.count)
    helper(a, subset: &subset, i:0)
}

func helper(_ a: [Int], subset: inout [Int?], i: Int) {
    int += 1
    if i == a.count {
        let subset = subset.compactMap({$0})
        print(subset)
        return
    }

    subset[i] = a[i]
    helper(a, subset: &subset, i: i + 1)

    subset[i] = nil
    helper(a, subset: &subset, i: i + 1)
}

//findSubsets([1, 2, 3, 4])


func findIterativeSubsets(_ a: [Int]) {
    print([])
    for i in 0..<a.count {
        print("\([a[i]])")
        print(a[0..<i])
    }
    print(a)
}

//findIterativeSubsets([1, 2, 3])

//func findIntersaction(a: [Int], b: [Int]) -> [Int]{
//    var source: [Int] = []
//    var intersection: [Int] = []
//    var element: Int = 0
//    var upperBound: Int = 0
//    if a.first! < b.first! {
//        source = b
//        element = b.first!
//
//    } else {
//        element = a.first!
//    }
//
//    if a.last! < b.last! {
//        upperBound = a.last!
//    } else {
//        upperBound = b.last!
//    }
//
//    return Array(element ... upperBound)
//}


//findIntersaction(a: [3, 4, 5, 6, 7, 8], b: [1, 2, 3, 4, 5, 6, 7])

import UIKit

func createData() -> [UIView] {
    let superV = UIView()
    superV.tag = 0

    let view1 = UIView()
    view1.tag = 1
    let view2 = UIView()
    view2.tag = 2
    let view3 = UIView()
    view3.tag = 3
    let view4 = UIView()
    view4.tag = 4
    let view5 = UIView()
    view5.tag = 5
    let view6 = UIView()
    view6.tag = 6
    let view7 = UIView()
    view7.tag = 7
    superV.addSubview(view1)
    view1.addSubview(view2)
    view2.addSubview(view3)

    superV.addSubview(view4)
    view4.addSubview(view5)
    view5.addSubview(view6)

    superV.addSubview(view7)

    return [superV, view1, view2, view3, view4, view5, view6, view7]
}

func findCommonSuper(view1: UIView, view2: UIView) -> Int? {
    var v1Super = [Int: UIView]()
    var input1: UIView? = view1
    while input1 != nil {
        v1Super[input1!.tag] = input1
        input1 = input1!.superview
    }

    print(v1Super.keys)

    var v2Super = [Int: UIView]()
    var input2: UIView? = view2
    while input2 != nil {
        v2Super[input2!.tag] = input2
        input2 = input2!.superview
    }

    print(v2Super.keys)


    for key in v1Super.keys {
        if v2Super[key] != nil {
            return v2Super[key]?.tag
        }
    }

    return nil
}

let views = createData()

findCommonSuper(view1: views[3], view2: views[6])




public class Node {
    var next: Node? = nil
    var value: Int

    init(value: Int) {
        self.value = value
    }
}


let node0 = Node(value: 0)
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)
let node6 = Node(value: 6)

node0.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

func reverseLinkList(head: Node) -> Node? {
    var previous: Node? = nil
    var head: Node? = head
    while head != nil {
        let next = head?.next
        head?.next = previous
        previous = head
        head = next
    }

    return previous
}

let newNode = reverseLinkList(head: node0)


public extension String.StringInterpolation {
    mutating func appendInterpolation(node: Node?) {
        var text = ""
        var node: Node? = node
        while node != nil {
            text.append("\(String(describing: node!.value))-->")
            node = node?.next
        }
        text.append("Null")

        appendLiteral(text)
    }
}

print("newList \(node: newNode)")

func reverseNodeRecusive(head: Node?) -> Node? {
    if head == nil || head?.next == nil {
        return head
    }

    let p = reverseNodeRecusive(head: head?.next)
    head?.next?.next = head
    head?.next = nil
    return p
}

print("recursive LinkedList \(node: reverseNodeRecusive(head: newNode))")

func climbStairs(_ n: Int) -> Int {
    var memo = [Int: Int]()

    return helper(source: 0, destination: n, memo: &memo)
}

func helper(source: Int, destination: Int, memo: inout [Int: Int]) -> Int {
    if memo[source] != nil {
        return memo[source]!
    }

    if source == destination {
        return 0
    }

    if source == (destination - 1) {
        return 1
    }

    let result = helper(source: source + 1, destination: destination, memo: &memo) + helper(source: source + 2, destination: destination, memo: &memo)
    memo[source] = result
    return result
}

climbStairs(4)



func sendAllZerosToFront(a: [Int]) -> Int {
    var a = a
    var j = 0
    var numberOfZeros = 0

    for i in 1 ..< a.count {
        if a[i] == 0 {
            swap(a:i, b:j , array: &a)
            numberOfZeros += 1
            j += 1
        }
    }
    print(a)

    return numberOfZeros

}

func swap(a: Int, b: Int, array: inout [Int]) {
    let temp = array[a]
    array[a] = array[b]
    array[b] = temp
}

sendAllZerosToFront(a: [1, 3, 2, 5, 0, 3, 0 ,4, 0, 0, 1])



//class Enumurator {
//    init(a[int])
//}


//func findDuplicate(inArray a: [Int]) {
//    let offset = 50
//
//    let count = a.count
//
//    for i in 0..<count {
//        if a[i] != i {
//            while a[i] != i {
//                swap(i, a[i], )
//            }
//        }
//    }
//
//}


func combination(phrase: String) {
    var array = [String]()
    var mapping: [String] = [
        "1",
        "abc",
        "def",
        "ghi",
        "jkl",
        "mno",
        "pqrs",
        "tuv",
        "wxyz"
    ]
    
    let memo: [Int: String] = [:]
    
    
    combinationRecursive(phrase: phrase, currentString: "", currentIndex: 1, mapping: mapping, result: &array)
    
}

func combinationRecursive(phrase: String, currentString: String, currentIndex: Int, mapping: [String], result: inout [String]) {
    if currentString.count == phrase.count - 1 {
        result.append(currentString)
        return
    }
    
 
    
    let index =   Int(String([Character](phrase)[currentIndex]))!
    
    let chars =  [Character](mapping[index])  // mapping[currentIndex]
    
    for char in chars {
        
        combinationRecursive(phrase: phrase, currentString: currentString + String(char), currentIndex: currentIndex + 1, mapping: mapping, result: &result)
        
    }
    
}

func helperfindCombination(phrase: String, partialString: String, currentIndex: Int, mapping: [Character]) {
   // print("helperfindCombination(phrase: \(phrase), partialString: \(partialString)), currentIndex: \(currentIndex)), mapping: \(mapping))")
    if currentIndex >= phrase.count {
        print(partialString)
        return
    }
    
    //    var partialString = partialString
    
    let num = Int(String(Array(phrase)[currentIndex]))!
    helperfindCombination(phrase: phrase, partialString: partialString + String(mapping[num]), currentIndex: currentIndex + 1, mapping: mapping)
    
    if (currentIndex + 1) < phrase.count {
        let num2 = String(num) + String(Int(String(Array(phrase)[currentIndex + 1]))!)
        
        let secondIndex = Int(num2)!
        if secondIndex < 27 {
            helperfindCombination(phrase: phrase, partialString: partialString + String(mapping[secondIndex]), currentIndex: currentIndex + 2, mapping: mapping)
        }
    }
    
}

func findAllCombinations(phrase: String) {
    let mapping: [Character] = [
        "0",
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z"
    ]
    helperfindCombination(phrase: phrase, partialString: "", currentIndex: 0, mapping: mapping)
    
}



findAllCombinations(phrase: "12")
