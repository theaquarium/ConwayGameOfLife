/*
var myArray = Array2D(numberRows: 3, numberCols: 4)
print("This is my array:\n\(myArray)")
print("The element at (1, 2) is:", myArray.get(row: 1, col: 2))

myArray.set(row: 1, col: 2, value: 1)
print("The element at (1, 2) is now:", myArray.get(row: 1, col: 2))
print("This is my array now:\n\(myArray)")

var counter = 0
for row in 0..<myArray.numberRows {
    for col in 0..<myArray.numberCols {
        myArray[row, col] = counter
        counter += 1
    }
}
print("This is my array now:\n\(myArray)")
*/

/*
func testArray2D(){
    var data = Array2D(numberRows: 5, numberCols: 10)
    var count = 1
    for row in 0..<data.numberRows {
        for col in 0..<data.numberCols {
            data.set(row: row, col: col, value: count)
            count += 1
        }
    }
    print(data)
}
testArray2D()
*/

/*
func testArray2DB(){
    var data = Array2DB(numberRows: 5, numberCols: 10)
    var count = 1
    for row in 0..<data.numberRows {
        for col in 0..<data.numberCols {
            data.set(row: row, col: col, value: count)
            count += 1
        }
    }
    print(data)

    print("With border:")
    // Get max number size to print it nice
    var maxSize = 0
    for num in data.data {
        maxSize = max(maxSize, String(num).count)
    }

    var result = ""
    for row in -1..<(data.numberRows + 1) {
        for col in -1..<(data.numberCols + 1) {
            // Make all strings uniform length so it prints nice
            var point = String(data[row, col])
            while (point.count < maxSize) {
                point += " "
            }
            result += "\(point) "
        }
        result += "\n"
    }
    print(result)
}
testArray2DB()
*/

/*
let size = 20
var myConway = Colony(colonySize: size)
print("This is my GOL\n\(myConway)")
var counter2 = 0
for row in 0..<size {
    for col in 0..<size {
        if counter2 % 2 == 0 {
            myConway.setCellDead(row: row, col: col)
        } else {
            myConway.setCellAlive(row: row, col: col)
        }
        counter2 += 1
    }
}
print("This is my GOL now\n\(myConway)")
*/

/*let size = 20
var myConway = Colony(colonySize: size)
print("This is my GOL\n\(myConway)")
var counter2 = 0
for row in 0..<size {
    for col in 0..<size {
        if counter2 % 2 == 0 {
            myConway.setCellDead(row: row, col: col)
        } else {
            myConway.setCellAlive(row: row, col: col)
        }
        counter2 += 1
    }
}
print("This is my GOL now\n\(myConway)")

print("Let's start evolving")
var text = readLine()!
while text != "q" {
    myConway.evolve()
    print("\(myConway)\nPress enter to evolve")

    text = readLine()!
}*/

/*var game = GameOfLifeUI()
game.runGame()*/

var colony = Colony(colonySize: 10)
colony.setCellAlive(row: 5, col: 3)
colony.setCellAlive(row: 5, col: 4)
colony.setCellAlive(row: 5, col: 5)
colony.setCellAlive(row: 4, col: 5)
colony.setCellAlive(row: 3, col: 4)
print(colony)

for _ in 0..<12{
    colony.evolve()
    print(colony)
}