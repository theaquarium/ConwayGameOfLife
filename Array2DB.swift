import Foundation

struct Array2DB : CustomStringConvertible {
    let numberRows: Int
    let numberCols: Int
    var data: [Int]

    init(numberRows: Int, numberCols: Int) {
        self.numberRows = numberRows
        self.numberCols = numberCols

        // Initialize empty data array
        data = Array(repeating: 0, count: (numberRows + 2) * (numberCols + 2))
    }
    
    func indexIsValid(row: Int, col: Int) -> Bool {
        return
            row >= -1 &&
            col >= -1 &&
            row < numberRows + 1 &&
            col < numberCols + 1
    }

    // Get data array index of certain element
    func index(row: Int, col: Int) -> Int {
        // Account for border
        return (row + 1) * (numberCols + 2) + col + 1
    }

    mutating func set(row: Int, col: Int, value: Int) {
        if !indexIsValid(row: row, col: col) {
            print("Index out of bounds")
            exit(1)
        }
        data[index(row: row, col: col)] = value
    }

    func get(row: Int, col: Int) -> Int {
        if !indexIsValid(row: row, col: col) {
            print("Index out of bounds")
            exit(1)
        }
        return data[index(row: row, col: col)]
    }

    subscript(row: Int, col: Int) -> Int {
        get {
            return get(row: row, col: col)
        }
        set {
            return set(row: row, col: col, value: newValue)
        }
    }

    var description: String {
        // Get max number size to print it nice
        var maxSize = 0
        for num in data {
            maxSize = max(maxSize, String(num).count)
        }

        var result = ""
        for row in 0..<numberRows {
            for col in 0..<numberCols {
                // Make all strings uniform length so it prints nice
                var point = String(get(row: row, col: col))
                while (point.count < maxSize) {
                    point += " "
                }
                result += "\(point) "
            }
            result += "\n"
        }
        return result
    }
}