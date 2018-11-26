import UIKit

//Open lock problem


/// Given a lock code this method print all the possible combination
/// after one step. one step is rotating one wheel one time
/// - Parameter key: Initial lock string
/// - Returns: combinations after one move
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
    var visited = Set<String>([])
    let dead = Set(deadends)
    let q = MyQueue<String>(size: 1000)
    
    let root = "0000"
    if root == target { return 0 }
    if dead.contains(root) { return -1 }
    
    q.enQueue(root)
    var res = 0
    visited.insert(root)
    
    while q.isEmpty() == false {
        for _ in 0..<q.count() {
            let front = q.front()!
            if front == target { return res }
            q.deQueue()
            
            for child in childFor(front) {
                if visited.contains(child) || dead.contains(child) { continue }
                q.enQueue(child)
                visited.insert(child)
            }
        }
        res = res + 1
    }
    return -1
}

//Example
let result = openLock(["0201","0101","0102","1212","2002"], "0202")


//Minimum no of perfect sqares to match a sum



/// Returns perfect square less then or equal to number
///
/// - Parameter num: number
/// - Returns: array of perfect squares below or equal to it
func perfectSqareBelowOrEqual(_ num: Int) -> [Int] {
    var perfectSqares = [Int]()
    for i in 1...num {
        let square = i * i
        if square <= num {
            perfectSqares.append(square)
        } else {
            break
        }
    }
    
    return perfectSqares
}

//Example
let squares = perfectSqareBelowOrEqual(49)

//Node
class NodeTest: NSObject {
    var remaining: Int
    var value : Int
    
    init(remaining: Int, value: Int) {
        self.remaining = remaining
        self.value = value
    }
    
    static func ==(lhs: NodeTest, rhs: NodeTest) -> Bool {
        return lhs.remaining == rhs.remaining && lhs.value == rhs.value
    }
    
    override var description: String {
        return "\(value)"
    }
}

func numSquares(_ n: Int) -> Int {
    let q = MyQueue<NodeTest>(size: 100)
    var steps = 0
    let node = NodeTest(remaining: n, value: n)
    q.enQueue(node)
    
    var visited = Set([NodeTest]())
    
    while q.isEmpty() == false {
        for _ in 0..<q.count() {
            let front = q.front()!
            q.deQueue()

            let children = perfectSqareBelowOrEqual(front.remaining)
            for child in children {
                let node1 = NodeTest(remaining: (front.remaining - child), value: child)
                if node1.remaining == 0 {
                    steps = steps + 1
                    return steps
                }
                if node1.remaining >= 0, visited.contains(node1) == false {
                    q.enQueue(node1)
                    visited.insert(node1)
                }
            }
        }
        
        steps = steps + 1
    }
    return -1
}

//Example
numSquares(13)




/// Valid string, string which have properly closed brackets and only brackets
///
/// - Parameter s: string like "(()){{})}]"
/// - Returns: Bool
func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    if s.isEmpty == true { return true }
    
    stack.append(s.first!)
    
    for char in s.suffix(from: s.index(after: s.startIndex))  {
        if char == ")" && stack.last == "(" {
            stack.removeLast()
        } else if char == "}" && stack.last == "{" {
            stack.removeLast()
        } else if char == "]" && stack.last == "[" {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    return stack.isEmpty
}

//Example
isValid("[[}]]")



func dailyTemperatures(_ T: [Int]) -> [Int] {
    return [1]
}
