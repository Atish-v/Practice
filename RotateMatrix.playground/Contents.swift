
var ThreeDArray = [
    [1,2,3],
    [3,4,5],
    [6,7,8]
]
let count = ThreeDArray.count

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


var str = "Hello, playground"



printArray(array: ThreeDArray)

for i in 0..<count {
    for j in i+1..<ThreeDArray[i].count {
        let temp = ThreeDArray[i][j]
        ThreeDArray[i][j]=ThreeDArray[j][i]
        ThreeDArray[j][i]=temp;
    }
}

printArray(array: ThreeDArray)

for i in 0..<count{
    for j in 0..<count/2 {
        let temp = ThreeDArray[i][j]
        ThreeDArray[i][j]=ThreeDArray[i][count-j-1]
        ThreeDArray[i][count-j-1]=temp
    }
}

printArray(array: ThreeDArray)




var matrix = [[ 1,2,3 ], [4,5,6], [7,8,9]]
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
    
    for i in 0..<count {
        for j in 0..<count/2 {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[i][count-1-j]
            matrix[i][count-1-j] = temp
        }
    }
    
    printArray(array: matrix)
}


rotate(&matrix)

import Foundation

//Circular Queue implementation
class MyCircularQueue<T: Equatable> {
    
    private var storage: [T?]
    private var size: Int
    
    var head: Int = -1
    var tail: Int = -1
    
    init(size n: Int) {
        storage = Array(repeating: nil, count: n)
        self.size = n
    }
    
    func enqueue(_ value: T) -> Bool {
        if isFull() == true {
            return false
        }
        
        if isEmpty() {
            head = 0
        }
        
        tail = (tail + 1) % size
        storage[tail] = value
        
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() == true {
            return false
        }
        
        if head == tail {
            storage[head] = nil
            head = -1
            tail = -1
            return true
        }
        
        storage[head] = nil
        head = (head + 1) % size
        
        return true
    }
    
    func isFull() -> Bool {
        return (tail + 1) % size == head
    }
    
    func isEmpty() -> Bool {
        return head == -1 && tail == -1
    }
    
    func front() -> T? {
        if isEmpty() == true {
            return nil
        }
        
        return storage[head]!
    }
    
    func end() -> T? {
        if isEmpty() == true {
            return nil
        }
        return storage[tail]!
    }
    
    func count() -> Int {
        if isEmpty() {
            return 0
        }
        
        if isFull() {
            return size
        }
        
        if head <= tail {
            return tail - head + 1
        }
        
        if head > tail {
            return (size - head) + tail + 1
        }
        
        return 0
    }
}

let q = MyCircularQueue<Int>(size: 5)
q.count

q.enqueue(2)
q.enqueue(3)
q.count()

q.deQueue()
q.deQueue()

q.count()

q.enqueue(1)
q.enqueue(1)
q.enqueue(1)
q.enqueue(1)

q.count()


// Tree fromation

class Node: NSObject {
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
    let myQueue = MyCircularQueue<Node>(size: 20)
    myQueue.enqueue(root)
    var step = 0
    while myQueue.isEmpty() == false {
        step = step + 1
        for _ in 0..<count {
            if let first = myQueue.front() {
                print(first.value)
                myQueue.deQueue()
                for child in first.children ?? [] {
                    myQueue.enqueue(child)
                }
            }
        }
    }
    
    return step
}


let steps = breadthFirstSearch(root: root)

func childFor(_ key: String) -> [String] {
    var res: [[Character]] = []
    
    for (index, char) in Array(key).enumerated() {
        var chars = Array(key)
        if let num = Int(String(char)) {
            let forward = (num + 1) % 10
            chars[index] = Character.init("\(forward)")
            res.append(chars)
            
            let backword = (num - 1 + 10) % 10
            chars[index] = Character.init("\(backword)")
            res.append(chars)
        }
    }
    return res.compactMap({String($0)})
}

childFor("0000")


func openLock(_ deadends: [String], _ target: String) -> Int {
    
    var visited = [String]()
    let q = MyCircularQueue<String>(size: 1000)
    
    let root = "0000"
    if root == target { return 0 }
    if deadends.contains(root) { return -1 }
    
    q.enqueue(root)
    var res = 0
    visited.append(root)
    
    while q.isEmpty() == false {
        res = res + 1
        for _ in 0..<q.count() {
            let front = q.front()!
            if front == target { return res }
            q.deQueue()
            
            for child in childFor(front) {
                if visited.contains(child) { continue }
                if deadends.contains(child) == false {
                    q.enqueue(child)
                    visited.append(child)
                }
            }
        }
    }
    return -1
}

let result = openLock(["0201","0101","0102","1212","2002"], "0202")
