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

func createReversedLinkList(num: Int) -> ListNode {
    var sum = num
    let result: ListNode = ListNode(sum % 10)
    var last: ListNode = result
    while sum / 10 != 0 {
        sum = sum / 10
        let l1 = ListNode(sum % 10)
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

//let result = addTwoNumbers(l1, l2)
//printList(node: result)



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


// a b c d a c s d a r e f
func lengthOfLongestSubstring(_ s: String) -> Int {
    var dict: [Character: Int] = [:]
    var max = 0
    var current = 0
    for (index, char) in s.enumerated() {
        if dict[char] == nil {
            dict[char] = index
            current = current + 1
            if current > max {
                max = current
            }
        } else {
            let previousIndex = dict[char] ?? 0
            if (index - previousIndex) > max {
                max = index - previousIndex
            }
            
            dict[char] = index
            current = 1
        }
    }
    
    return current > max ? current : max
}

lengthOfLongestSubstring("aab")


//max 3
//mac 3
//max 3
//
//////a b c a b c b b e f c
//          i     j
//i = a
//
//
//



























//[a] = 0
//[b] = 1
//[c] = 2  max = 3 - 0 = 3
//
//
//////a
//[a] = 3
//[b] = 1
//[c] = 2  max 4 - 1 = 3
//
//
////b
//[b] = 4
//[a] = 3
//[c] = 2 max 5 - 3 = 2
//
//
////c
//[b] = 4
//[a] = 3
//[c] = 5 max 6 - 4 = 2
//
////b
//[b] = 7
//[a] = 3
//[c] = 5 max 8 - 7 = 1








//var dict: [Character: Int] = [:]
//var max = 0
//var offset = -1
//var previousKey: Character? = nil
//for (index, char) in s.enumerated() {
//    if dict[char] == nil {
//        dict[char] = index
//    } else {
//        if ((dict[previousKey!] ?? 0) + 1 - offset + 1) > max {
//            max = ((dict[previousKey!] ?? 0) + 1 - offset + 1)
//        }
//        offset = (dict[char!] ?? 0)
//        dict[char] = index
//    }
//
//    previousKey = char
//}
//
//offset = offset + 0
//max = max + 0
//let finalCount = (dict[previousKey!] ?? 0) + 1 - offset + 1
//return finalCount > max ? finalCount : max
//

//
//
//[a] = 0
//[b] = 1
//[c] = 2  max = 2+1-0 = 3
//
//
////Offset = 0
//[b] = 1
//[c] = 2
//[a] = 3 max = 3+1-0 = 4
//
////offset = 1
//[c] = 2
//[a] = 3
//[b] = 4 max = 4+1-1 = 4
//
////offset 2
//[a] = 3
//[b] = 4
//[c] = 5 max 5+1-2 = 4
//
////offset 4
//[a] = 3
//[c] = 5
//[b] = 6 max 6+1-4 = 3
//
//// offset = 6
//[a] = 3
//[c] = 5
//[b] = 7 max 7+1-6 = 2
//
//
//
//
//

//[a] = 1
//[b] = 1
//[c] = 1
//[a] = 2
//a b c d d a e g f



class MyCircularQueue {
    
    var start = -1
    var end = -1
    var storage: [Int?]!
    let size: Int!
    
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
      storage = [Int?](repeating: nil, count: k)
        size = k
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        guard isFull() == false else { return false }
        if start == -1 { start = 0 }
        end = (end + 1) % size
        storage[end] = value
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        guard isEmpty() == false else { return false }
        if start == end {
            storage[start] = nil
            start = -1
            end = -1
            return true
        } else {
            storage[start] = nil
            start = (start + 1) % size
            return true
        }
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        if start == -1 { return -1 }
        
        return storage[start] ?? -1
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        if end == -1 { return -1 }
        return storage[end] ?? -1
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
       return (start == -1) && (end == -1)
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return ((end - start) == -1) || ((end - start) == (size - 1))
    }
}




["MyCircularQueue","enQueue","enQueue","enQueue","enQueue","Rear","isFull","deQueue","enQueue","Rear"]

let queue = MyCircularQueue(10)
queue.enQueue(1)
queue.enQueue(2)
queue.enQueue(3)
queue.enQueue(4)
queue.Rear()
queue.isFull()
queue.storage
queue.start
queue.end
queue.deQueue()
queue.enQueue(5)
queue.Rear()
queue.storage
