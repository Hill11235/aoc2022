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
        arr = line.scan(/\w/)
        @grid.append(arr)
    end

    def runChecks(x, y)
        return verticalCheck(x, y) || horizontalCheck(x, y)
    end

    def verticalCheck(x, y)
        height = @grid[y][x]
        topCheck = true
        bottomCheck = true

        counter = 0
        while counter < y
            if @grid[counter][x] >= height
                topCheck = false
            end
            counter += 1
        end

        counter += 1
        while counter < @grid.length
            if @grid[counter][x] >= height
                bottomCheck = false
            end
            counter += 1
        end
        return topCheck || bottomCheck
    end

    def horizontalCheck(x, y)
        row = @grid[y]
        left = row[0, x]
        right = row[x + 1, row.length]
        height = row[x]
        leftCheck = true
        rightCheck = true

        left.each { |val|
            if val >= height
                leftCheck = false
            end
        }

        right.each { |val|
            if val >= height
                rightCheck = false
            end
        }

        return leftCheck || rightCheck
    end

    def question1
        running_total = 0
        parseDataFile

        @grid.each_with_index { |arr, y|
            arr.each_with_index { |val, x|
                if x == 0 || y == 0 || x == @grid.length - 1 || y == @grid.length - 1
                    running_total += 1 
                elsif runChecks(x, y)
                    running_total += 1
                end
            }
        }

        return running_total
    end

    def question2

    end
end

dataFile = "real.txt"
forest = TreeGrid.new(dataFile)
puts forest.question1