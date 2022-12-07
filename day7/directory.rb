require_relative 'elfFile'

class Directory

    def initialize(name, parentDir)
        @name = name
        @parentDir = parentDir
        @files = []
        @children = []
        if parentDir != nil
            @parentDir.addChild(self)
        end
    end

    def name
        @name
    end

    def parentDir
        @parentDir
    end

    def getChild(name)
        @children.each {|dir|
            if dir.name == name
                return dir
            end
        }
        return nil
    end

    def getTotalSizeOfDir
        size = self.getSizeOfFiles
        searchList = self.getChildrenCopy

        while searchList.length > 0
            activeDir = searchList.pop()
            children = activeDir.getChildrenCopy
            
            searchList += children
            size += activeDir.getSizeOfFiles
        end

        return size
    end

    def printDir
        searchList = self.getChildrenCopy
        puts "dir #{self.name}"
        self.printFiles

        while searchList.length > 0
            activeDir = searchList.shift
            children = activeDir.getChildrenCopy

            searchList = children + searchList
            puts "dir #{activeDir.name}"
            activeDir.printFiles
        end
    end

    def getSizeOfFiles
        total_size = 0

        @files.each {|file|
            total_size += file.size
        }

        return total_size
    end

    def printFiles
        @files.each {|file|
            file.print
        }
    end

    def getStringPath
        activeDir = self
        path = ""

        while activeDir.parentDir != nil
            path = "/#{activeDir.name}" + path
            activeDir = activeDir.parentDir
        end

        return path
    end

    def addFile(file)
        @files.append(file)
    end

    def addChild(dir)
        @children.append(dir)
    end

    def getChildrenCopy
        return Marshal.load(Marshal.dump(@children))
    end
end