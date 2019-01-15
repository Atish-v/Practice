//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/****
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
*****/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode {
    var first = l1
    var second = l2
    var result: ListNode?
    var last: ListNode?
    var reminder:Int = 0
    while (first != nil || second != nil) {
        let sum = (first?.val ?? 0) + (second?.val ?? 0) + reminder
        reminder = sum / 10
        let value = sum % 10
        if result == nil {
            result = ListNode(value)
            last = result
        } else {
            let new = ListNode(value)
            last?.next = new
            last = new
        }
        
        first = first?.next
        second = second?.next
    }
    
    if reminder != 0 {
        last?.next = ListNode(reminder)
    }
    
    return result!
}


//let l1 = ListNode(2)
//let l2 = ListNode(4)
//let l3 = ListNode(3)
//
//l1.next = l2
//l2.next = l3
//
//let l4 = ListNode(5)
//let l5 = ListNode(6)
//let l6 = ListNode(7)
//l4.next = l5
//l5.next = l6

func createReversedLinkList(num: CUnsignedLongLong) -> ListNode {
    var sum = num
    let result: ListNode = ListNode(Int(sum % 10))
    var last: ListNode = result
    while sum / 10 != 0 {
        sum = sum / 10
        let l1 = ListNode(Int(sum % 10))
        last.next = l1
        last = l1
    }
    
    return result
}

func printList(node: ListNode) -> String {
    var description = "\(node.val)"
    var current = node
    while current.next != nil {
        current = current.next!
        description.append("\(String(describing: current.val))")
    }
    
    return description
}

let l1 = createReversedLinkList(num: 13252)
let l2 = createReversedLinkList(num: 42313)

let result = addTwoNumbers(l1, l2)
printList(node: result)



/*****
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].

 
******/
func sumToTarget(array: [Int], target: Int) -> [Int] {
    
    var dict = [Int: Int]()
    
    for i in 0..<array.count {
        if dict[array[i]] != nil {
            return [ dict[array[i]]!, i ]
        }
        
        dict[target - array[i]] = i
    }
    
    return []
}
