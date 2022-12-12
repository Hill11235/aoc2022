class Day5

    def initialize(fileName)
        @fileName = fileName
    end

    def parseFile
        File.readlines(@fileName).each do |line|
            parseLine(line)
        end
    end

    def parseLine(line)

    end

    def question1

    end

    def question2

    end
end

fileName = "test.txt"
instance = Day5.new(fileName)
instance.question1
instance.question2