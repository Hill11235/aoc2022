class Day5

    def initialize(fileName)
        @fileName = fileName
        @stacks = []
    end

    def parseFile(question1)
        File.readlines(@fileName).each do |line|
            parseLine(line, question1)
        end
    end

    def parseLine(line, question1)
        if @stacks.length == 0
            createStacks(line)
        end
        if line.include?("[")
            addToStacks(line)
        elsif line.include?("move")
            moveItems(line, question1)
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

    def moveItems(line, question1)
        words = line.split
        if question1
            shiftFreightIndividual(words[1].to_i, words[3].to_i, words[5].to_i)
        elsif
            shiftFreightMultiple(words[1].to_i, words[3].to_i, words[5].to_i)
        end
    end

    def shiftFreightIndividual(howMany, from, to)
        howMany.times do
            cargo = @stacks[from - 1].shift
            @stacks[to - 1].unshift(cargo)
        end
    end

    def shiftFreightMultiple(howMany, from, to)
        howMany = [howMany - 1, 0].max
        lifted = @stacks[from - 1].slice!(0..howMany)
        @stacks[to - 1] = lifted + @stacks[to - 1]
    end

    def printTopLine
        @stacks.each { |x|
            print x[0]
        }
        puts ""
    end

    def question(question1)
        parseFile(question1)
        printTopLine
    end
end

fileName = "real.txt"
instance = Day5.new(fileName)
#instance.question(true)
instance.question(false)