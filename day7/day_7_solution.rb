require_relative 'directory'
require_relative 'elfFile'

class FileStructure

    def initialize(fileName)
        @fileName = fileName
        @rootDir = Directory.new("/", nil)
        @directoryList = [@rootDir]
        @activeDir = nil
    end

    def parseDataFile(dataFile)
        File.readlines(@fileName).each do |line|
            parseLine(line)
        end
    end

    def parseLine(line)
        if line.include? "$ cd "
            handleCd(line)
        elsif line.include? "dir "
            handleDir(line)
        elsif !line.include? "$ ls\n"
            handleFile(line)
        end
    end

    def handleCd(str)
        arr = str.split
        keyChange = arr[2]

        if keyChange == "/"
            @activeDir = @rootDir
        elsif keyChange == ".."
            @activeDir = @activeDir.parentDir
        else
            @activeDir = @activeDir.getChild(keyChange)
        end
    end

    def handleDir(str)
        arr = str.split
        keyChange = arr[1]
        createNewDir(keyChange, @activeDir)
    end

    def handleFile(str)
        arr = str.split
        newFile = ElfFile.new(arr[1], arr[0].to_i, @activeDir)
    end

    def createNewDir(name, parentDir)
        newDir = Directory.new(name, parentDir)
        @directoryList.append(newDir)
        return newDir
    end

    def getDir(name)
        @directoryList.each {|dir|
            if dir.name == name
                return dir
            end
        }
        return nil
    end

    def getAllDirSizes
        sizeMap = {}

        @directoryList.each {|dir|
            sizeMap.store(dir.getStringPath, dir.getTotalSizeOfDir)
        }

        return sizeMap
    end

    def question1(limit)
        parseDataFile(@fileName)
        dirSizes = getAllDirSizes

        total_size = 0
        dirSizes.each do |k, v|
            if v <= limit
                total_size += v
            end
        end

        return total_size
    end

    def question2(update_space)
        max_disc_space = 70000000
        parseDataFile(@fileName)
        dirSizes = getAllDirSizes
        totalOccupiedSpace = @rootDir.getTotalSizeOfDir
        unusedSpace = max_disc_space - totalOccupiedSpace
        neededSpace = update_space - unusedSpace

        smallestDir = 2000000000
        dirSizes.each do |k, v|
            if v > neededSpace && v < smallestDir
                smallestDir = v
            end
        end

        puts smallestDir
    end
end

dataFile = "real.txt"
fs = FileStructure.new(dataFile)
puts fs.question2(30000000)