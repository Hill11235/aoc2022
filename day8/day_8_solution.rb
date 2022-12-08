# parse file into array of arrays (watch for new line characters)
# vertical check for a given cell
# horizontal check for a given cell
# loop across array and do check for each cell not on edge
# keep running total

class TreeGrid

    def initialize(fileName)
        @fileName = fileName
        @grid = []
    end

    def parseDataFile
        File.readlines(@fileName).each do |line|
            parseLine(line)
        end
    end

    def parseLine(line)
        # split line by individual chars, pop last, add arr to grid
    end

    # TODO: change to check both top and bottom
    def verticalCheck(x, y)

    end

    # TODO: change to check both left and right functionality
    def horizontalCheck(x, y)
        row = @grid(x)
        height = row[y]

        row.each_with_index { |val, index|
            if index != y && val
        }

        end
        
        return true
    end

    def question1

    end

    def question2

    end
end

dataFile = "test.txt"
forest = TreeGrid.new(dataFile)