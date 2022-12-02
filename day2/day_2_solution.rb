class Day2

    def initialize(fileName)
        @fileName = fileName
        @outcomeMap = {"W" => 6, "D" => 3, "L" => 0}
        @shapeMap = {"X" => 1, "Y" => 2, "Z" => 3}
        @determineOutcomeMap = {"AY" => "W", "AZ" => "L", "BX" => "L", "BZ" => "W", "CX" => "W", "CY" => "L", "AX" => "D", "BY" => "D", "CZ" => "D"}
    end

    def getScore(shapeP1, shapeP2)
        gameOutcome = getOutcome(shapeP1, shapeP2)
        return @shapeMap[shapeP2] + @outcomeMap[gameOutcome]
    end

    def getOutcome(shapeP1, shapeP2)
        return @determineOutcomeMap[shapeP1 + shapeP2]
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

game = Day2.new("strat.txt")
game.runLoop
