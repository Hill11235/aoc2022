class Day5

    def initialize(fileName)
        @fileName = fileName
        @stacks = []
    end

    def parseFile
        File.readlines(@fileName).each do |line|
            parseLine(line)
        end
    end

    def parseLine(line)
        if @stacks.length == 0
            createStacks(line)
        end
        if line.include?("[")
            addToStacks(line)
        elsif line.include?("move")
            moveItems(line)
        end
    end

    def createStacks(line)
        numStacks = line.length / 4
        numStacks.times do
            @stacks.append([])
        end
    end

    def addToStacks(line)
        i = 1
        chars = line.split('')
        
        while i < line.length
            if chars[i] != " "
                index = (i - 1) / 4
                @stacks[index].append(chars[i])
            end
            i += 4
        end
    end

    def moveItems(line)
        words = line.split
        shiftFreight(words[1].to_i, words[3].to_i, words[5].to_i)
    end

    def shiftFreight(howMany, from, to)
        howMany.times do
            cargo = @stacks[from - 1].shift
            @stacks[to - 1].unshift(cargo)
        end
    end

    def printTopLine()
        @stacks.each { |x|
            print x[0]
        }
    end

    def question1
        parseFile
        printTopLine
    end

    def question2

    end
end

fileName = "real.txt"
instance = Day5.new(fileName)
instance.question1
#instance.question2