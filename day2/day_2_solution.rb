class Day2

    def initialize(fileName, q2)
        @fileName = fileName
        @q2 = q2
        @outcomeMap = {"W" => 6, "D" => 3, "L" => 0}
        @shapeMap = {"X" => 1, "Y" => 2, "Z" => 3}
        @determineOutcomeMap = {"AY" => "W", "AZ" => "L", "BX" => "L", "BZ" => "W", "CX" => "W", "CY" => "L", "AX" => "D", "BY" => "D", "CZ" => "D"}
        @determinePlayMap = {"AY" => "X", "AZ" => "Y", "BX" => "X", "BZ" => "Z", "CX" => "Y", "CY" => "Z", "AX" => "Z", "BY" => "Y", "CZ" => "X"}
    end

    def getScore(shapeP1, shapeP2)
        shapeP2 = updatePlay(shapeP1, shapeP2)
        gameOutcome = getOutcome(shapeP1, shapeP2)
        return @shapeMap[shapeP2] + @outcomeMap[gameOutcome]
    end

    def getOutcome(shapeP1, shapeP2)
        return @determineOutcomeMap[shapeP1 + shapeP2]
    end

    def updatePlay(shapeP1, shapeP2)
        if (@q2)
            return @determinePlayMap[shapeP1 + shapeP2]
        end
        return shapeP2
    end

    def runLoop()
        running_total = 0

        File.readlines(@fileName).each do |line|
            gameArr = line.split
            running_total += getScore(gameArr[0], gameArr[1])
        end

        puts running_total
    end
end

filename = "strat.txt"

game1 = Day2.new(filename, false)
game1.runLoop

game2 = Day2.new(filename, true)
game2.runLoop
