class FileStructure

    def initialize(fileName)
        @fileName = fileName
        @rootDir = Directory.new("/", nil)
        @directoryList = [rootDir]
        @activeDir = nil
    end

    # loop through file and parse file data
    # create dirs, set active dir, add parsed files
    def parseDataFile(dataFile)

    end

    def parseLine(line)

    end

    def handleCd(str)
        # three scenarios
        arr = str.split
        keyChange = arr[2]

        if keyChange == "/"
            @activeDir = @rootDir
        elsif keyChange == ".."
            @activeDir = @activeDir.parentDir
        else
            @activeDir = getDir(keyChange)
        end
    end

    def handleDir(str)
        arr = str.split
        keyChange = arr[1]
        createNewDir(keyChange, @activeDir)
    end

    def handleFile(str)
        arr = str.split
        newFile = ElfFile.new(arr[1], arr[0].to_i, @parentDir)
    end

    def createNewDir(name, parentDir)
        newDir = Directory.new(name, parentDir)
        @directoryList.append(newDir)
        return newDir
    end

    def getDir(name)
        @directoryList.each {|dir|
            if dir.file == name
                return dir
            end
        }
        return nil
    end

    def question1

    end

    def question2

    end
end

dataFile = "test.txt"