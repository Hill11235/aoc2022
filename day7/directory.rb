class Directory

    def initialize(name, parentDir)
        @name = name
        @parentDir = parentDir
        @files = []
        @children = []
    end

    def name
        @name
    end

    def parentDir
        @parentDir
    end

    def getTotalSizeOfDir
        size = self.getSizeOfFiles()
        searchList = getChildrenCopy

        while searchList.length > 0
            activeDir = searchList.pop
            searchList.append(activeDir.getChildrenCopy)
            size += activeDir.getSizeOfFiles
        end

        return size
    end

    def getSizeOfFiles
        total_size = 0

        @files.each {|file|
            total_size += file.size
        }
    end

    def addFile(file)
        @files.append(file)
    end

    def getChildrenCopy
        return @children.map(&:clone)
    end
end