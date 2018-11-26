
import Foundation

//: [Previous](@previous)

import Foundation


/**
 ** Implementation of Queue using array
 ** and Tree traversal using DFS
 **/

public protocol Queue {
    associatedtype Node: Equatable
    
    func enQueue(_ value: Node) -> Bool
    func deQueue() -> Bool
    
    func front() -> Node?
    func end() -> Node?
    
    func isEmpty() -> Bool
    func isFull() -> Bool
}

///Circular queue of Int

public class MyCircularQueue {
    private var storage: [Int?]
    private var size: Int
    
    var head: Int = -1
    var tail: Int = -1
    
    /** Initialize your data structure here. Set the size of the queue to be k. */
    public init(_ k: Int) {
        storage = Array(repeating: nil, count: k)
        self.size = k
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    public func enQueue(_ value: Int) -> Bool {
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
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    public func deQueue() -> Bool {
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
    
    /** Get the front item from the queue. */
    public func Front() -> Int {
        if isEmpty() == true {
            return -1
        }
        
        return storage[head]!
    }
    
    /** Get the last item from the queue. */
    public func end() -> Int {
        if isEmpty() == true {
            return -1
        }
        return storage[tail]!
    }
    
    /** Checks whether the circular queue is empty or not. */
    public func isEmpty() -> Bool {
        return head == -1 && tail == -1
    }
    
    /** Checks whether the circular queue is full or not. */
    public func isFull() -> Bool {
        return (tail + 1) % size == head
    }
}

//Examples
let obj = MyCircularQueue(10)
let ret_1: Bool = obj.enQueue(2)
let ret_2: Bool = obj.deQueue()
let ret_3: Int = obj.Front()
let ret_4: Int = obj.end()
let ret_5: Bool = obj.isEmpty()
let ret_6: Bool = obj.isFull()


/// Linear generic Queue
public class MyQueue<T: Equatable> : Queue {
    private var storage: [T]
    
    var head: Int = -1
    var tail: Int = -1
    
    public init(size n: Int) {
        storage = [T]()
    }
    
    public func enQueue(_ value: T) -> Bool {
        storage.append(value)
        return true
    }
    
    public func deQueue() -> Bool {
        if storage.isEmpty {
            return false
        }
        
        storage.remove(at: 0)
        return true
    }
    
    public func isFull() -> Bool {
        return false
    }
    
    public func isEmpty() -> Bool {
        return storage.isEmpty
    }
    
    public func front() -> T? {
        return storage.first
    }
    
    public func end() -> T? {
        return storage.last
    }
    
    public func count() -> Int {
        return storage.count
    }
    
}

///Generic Circular Queue
public class CircularQueue<T: Equatable>: Queue {
    private var storage: [T?]
    private var size: Int
    
    var head: Int = -1
    var tail: Int = -1
    
    public init(size n: Int) {
        storage = Array(repeating: nil, count: n)
        self.size = n
    }
    
    public func enQueue(_ value: T) -> Bool {
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
    
    public func deQueue() -> Bool {
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
    
    public func isFull() -> Bool {
        return (tail + 1) % size == head
    }
    
    public func isEmpty() -> Bool {
        return head == -1 && tail == -1
    }
    
    public func front() -> T? {
        if isEmpty() == true {
            return nil
        }
        
        return storage[head]!
    }
    
    public func end() -> T? {
        if isEmpty() == true {
            return nil
        }
        return storage[tail]!
    }
    
    public func count() -> Int {
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

let q = CircularQueue<Int>(size: 5)


