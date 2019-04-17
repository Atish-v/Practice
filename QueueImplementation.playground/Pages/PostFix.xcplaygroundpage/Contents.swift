//: [Previous](@previous)

import Foundation

    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [String]()
        let solve: (String, String, String) -> Int = { op, first, Second in
            switch op {
            case "+" :
                return Int(first)! + Int(Second)!
            case "-" :
                return Int(first)! - Int(Second)!
            case "/" :
                return Int(first)! / Int(Second)!
            case "*" :
                return Int(first)! * Int(Second)!
            default:
                return 0
            }
        }
        for token in tokens {
            if token == "+" || token == "*" || token == "/" || token == "-" {
                let first = stack.removeLast()
                let second = stack.removeLast()
                let result = solve(token, second, first)
                stack.append("\(result)")
            } else {
                stack.append(token)
            }
        }
        return Int(stack.removeLast())!
    }

//Example

//let result = evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])



func add<T: Sequence>(a: T, b: T) {
    
}

add(a: [1,2,3,4,5], b: "Atish")

