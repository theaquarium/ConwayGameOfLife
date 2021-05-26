struct Colony: CustomStringConvertible {
    let colonySize: Int
    var numberLivingCells: Int = 0
    var data: Array2DB
    var futureGen: Array2DB
    var generationNum: Int

    init(colonySize: Int) {
        self.colonySize = colonySize
        data = Array2DB(numberRows: self.colonySize, numberCols: self.colonySize)
        futureGen = data
        generationNum = 0
    }

    mutating func setCellAlive(row: Int, col: Int) {
        data[row, col] = 1
    }

    mutating func setCellDead(row: Int, col: Int) {
        data[row, col] = 0
    }

    mutating func resetColony() {
        data = Array2DB(numberRows: colonySize, numberCols: colonySize)
        futureGen = data
    }

    var description: String {
        var result = ""
        for row in 0..<data.numberRows {
            for col in 0..<data.numberCols {
                let point = data[row, col]
                switch (point) {
                    case 1:
                        result += Colorizer.green("*")
                    default:
                        result += "."
                }
            }
            result += "\n"
        }
        return result
    }

    func isCellAlive( row: Int, col: Int) -> Bool {
        return data[row, col] == 1
    }

    // Evolve helper
    mutating func setFutureCellAlive(row: Int, col: Int) {
        futureGen[row, col] = 1
    }

    // Evolve helper
    mutating func setFutureCellDead(row: Int, col: Int) {
        futureGen[row, col] = 0
    }

    mutating func setNextGen() {
        data = futureGen
    }

    mutating func evolve() {
        futureGen = data
        for row in 0..<colonySize {
            for col in 0..<colonySize {
                var neighborCount = 0
                // Read neighboring tiles
                neighborCount += data[row - 1, col - 1]
                neighborCount += data[row - 1, col]
                neighborCount += data[row - 1, col + 1]
                neighborCount += data[row, col - 1]
                neighborCount += data[row, col + 1]
                neighborCount += data[row + 1, col - 1]
                neighborCount += data[row + 1, col]
                neighborCount += data[row + 1, col + 1]
                // print("row: \(row) col: \(col) neighbors: \(neighborCount)")

                if neighborCount < 2 || neighborCount > 3 {
                    setFutureCellDead(row: row, col: col)
                } else if neighborCount == 3 {
                    setFutureCellAlive(row: row, col: col)
                }
            }
        }
        setNextGen()
        generationNum += 1
    }
}