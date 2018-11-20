
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

