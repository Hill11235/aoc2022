dayNumber = ARGV[0]
dirName = "day#{dayNumber}"
fileName = "day_#{dayNumber}_solution.rb"
Dir.mkdir(dirName)
Dir.chdir(dirName)

File.open("test.txt", "w")
File.open("real.txt", "w")
File.open(fileName, "w") {|f| 
    f.write("class Day#{dayNumber}

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

fileName = \"test.txt\"
instance = Day#{dayNumber}.new(fileName)
instance.question1
instance.question2") 
}

