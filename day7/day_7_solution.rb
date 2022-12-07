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

    def handleCd(str)
        # three scenarios
    end

    def handleDir(str)
        # create new fir correctly
    end

    def handleFile(str)
        # split line and create file using constituent parts
    end

    def createNewDir(name, parentDir)
        return Directory.new(name, parentDir)
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