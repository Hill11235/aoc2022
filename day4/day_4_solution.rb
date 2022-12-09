class Day4

    def initialize(fileName)
        @fileName = fileName
    end

    def parseLineQ1(line)
        arr = line.split(",")
        firstHalf = arr[0].split("-")
        secondHalf = arr[1].split("-")
        return contains(firstHalf, secondHalf)
    end

    def parseLineQ2(line)
        arr = line.split(",")
        firstHalf = arr[0].split("-")
        secondHalf = arr[1].split("-")
        return overlap(firstHalf, secondHalf)
    end

    def contains(firstPair, secondPair)
        return checkBoundaries(firstPair, secondPair) || checkBoundaries(secondPair, firstPair)
    end

    def checkBoundaries(firstPair, secondPair)
        firstLowerBound = firstPair[0].to_i
        firstUpperBound = firstPair[1].to_i
        secondLowerBound = secondPair[0].to_i
        secondUpperBound = secondPair[1].to_i

        return firstLowerBound <= secondLowerBound && firstUpperBound >= secondUpperBound
    end

    def overlap(firstPair, secondPair)
        return checkOverlapped(firstPair, secondPair) || checkOverlapped(secondPair, firstPair)
    end

    def checkOverlapped(firstPair, secondPair)
        firstLowerBound = firstPair[0].to_i
        firstUpperBound = firstPair[1].to_i
        secondLowerBound = secondPair[0].to_i
        secondUpperBound = secondPair[1].to_i

        firstScenario = firstLowerBound <= secondLowerBound && firstUpperBound >= secondLowerBound
        secondScenario = firstLowerBound >= secondLowerBound && firstLowerBound <= secondLowerBound

        return firstScenario || secondScenario
    end

    def question1
        containerCount = 0

        File.readlines(@fileName).each do |line|
            if parseLineQ1(line)
                containerCount += 1
            end
        end

        return containerCount
    end

    def question2
        overlapCount = 0

        File.readlines(@fileName).each do |line|
            if parseLineQ2(line)
                overlapCount += 1
            end
        end

        return overlapCount
    end

end

dataFile = "real.txt"
sol = Day4.new(dataFile)
puts sol.question2