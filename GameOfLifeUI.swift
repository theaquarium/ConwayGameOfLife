struct GameOfLifeUI {
    var colony: Colony

    init() {
        // Dummy colony
        colony = Colony(colonySize: 0)
    }

    private func getInput(prompt: String) -> String {
        print("\(prompt) ", terminator: "")

        let commandLine = readLine()!

        // Normalize commands with lowercase
        return commandLine.lowercased()
    }

    private func promptPointPair() -> (x: Int, y: Int) {
        var input = splitStringIntoParts(getInput(prompt: "Coor:"))

        if input.count == 0 {
            return (-1, -1)
        }

        while input.count < 2 ||
              Int(input[0]) == nil ||
              Int(input[0])! < 0 ||
              Int(input[0])! >= colony.colonySize ||
              Int(input[1]) == nil ||
              Int(input[1])! < 0 ||
              Int(input[1])! >= colony.colonySize {
            print("Please enter a valid coordinate pair in the format: x y")
            input = splitStringIntoParts(getInput(prompt: "Coor:"))
        }

        return (Int(input[0])!, Int(input[1])!)
    }

    mutating func runEvolutions(count: Int) {
        for _ in 0..<count {
            colony.evolve()
            print("Generation #\(colony.generationNum)")
            print("\(colony)\n")
        }
    }

    mutating func runGame() {
        print("Welcome to Conway's Game of Life")

        var colonySize = Int(getInput(prompt: "Colony size..."))
        while colonySize == nil || colonySize! < 1 {
            print("Please enter a valid colony size (integer greater than zero)")
            colonySize = Int(getInput(prompt: "Colony size..."))
        }
        colony = Colony(colonySize: colonySize!)

        print("Enter x y coordinates of living cells and a blank line when done")

        var pointPair = promptPointPair()
        while pointPair.x != -1 && pointPair.y != -1 {
            colony.setCellAlive(row: pointPair.y, col: pointPair.x)

            pointPair = promptPointPair()
        }

        print("Commands are:\nEnter an Int, evolve that number of generations\nQ, quit\nAny other text will evolve one generation")
        print("Generation #0")
        print("\(colony)\n")

        var command = getInput(prompt: "Command...")
        while command != "q" {
            let commandAsNumber = Int(command)
            if commandAsNumber == nil || commandAsNumber! < 1 {
                runEvolutions(count: 1)
                command = getInput(prompt: "Command...")
            } else {
                runEvolutions(count: commandAsNumber!)
                command = getInput(prompt: "Command...")
            }
        }

        print("Goodbye!")
    }
}