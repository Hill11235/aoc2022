class Directory

    def initialize(name, parentDir)
        @name = name
        @parentDir = parentDir
        @parentDir.addChild(self)
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
        size = self.getSizeOfFiles
        searchList = self.getChildrenCopy

        while searchList.length > 0
            activeDir = searchList.pop
            searchList.append(activeDir.getChildrenCopy)
            size += activeDir.getSizeOfFiles
        end

        return size
    end

    def printDir
        puts "Dir #{@name}"
        searchList = self.getChildrenCopy

        while searchList.length > 0
            activeDir = searchList.shift
            searchList = activeDir.getChildrenCopy.append(searchList)
            activeDir.printFiles
        end
    end

    def getSizeOfFiles
        total_size = 0

        @files.each {|file|
            total_size += file.size
        }
    end

    def printFiles
        @files.each {|file|
            file.print
        }
    end

    def addFile(file)
        @files.append(file)
    end

    def addChild(dir)
        @children.append(dir)
    end

    def getChildrenCopy
        return @children.map(&:clone)
    end
end