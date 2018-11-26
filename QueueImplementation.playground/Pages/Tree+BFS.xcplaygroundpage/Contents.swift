//: [Previous](@previous)

import Foundation

/// Tree fromation
open class Node: NSObject {
    var children: [Node]?
    var value: Int
    
    init(nodes: [Node]? , value:Int) {
        self.children = nodes
        self.value = value
    }
}

let root = Node(nodes:nil, value: 0)

let first1 = Node(nodes: nil, value: 1)
let first2 = Node(nodes: nil, value: 2)
let first3 = Node(nodes: nil, value: 3)
let first4 = Node(nodes: nil, value: 4)
let first5 = Node(nodes: nil, value: 5)
let first6 = Node(nodes: nil, value: 6)
let first7 = Node(nodes: nil, value: 7)
let first8 = Node(nodes: nil, value: 8)
let first9 = Node(nodes: nil, value: 9)

root.children = [first1, first2]
first1.children = [first3, first4]
first2.children = [first5, first6]
first3.children = [first7, first8]
first4.children = [first9]


func breadthFirstSearch(root: Node) -> Int {
    let myQueue = CircularQueue<Node>(size: 20)
    myQueue.enQueue(root)
    var step = 0
    while myQueue.isEmpty() == false {
        step = step + 1
        for _ in 0..<myQueue.count() {
            if let first = myQueue.front() {
                myQueue.deQueue()
                for child in first.children ?? [] {
                    myQueue.enQueue(child)
                }
            }
        }
    }
    
    return step
}

//Example
let steps = breadthFirstSearch(root: root)
