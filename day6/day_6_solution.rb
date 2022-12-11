class Day6

    def initialize(fileName)
        @fileName = fileName
        @dataBuffer = ""
    end

    def parseFile
        File.readlines(@fileName).each do |line|
            @dataBuffer = line
        end
    end
    
    def splitStringArray
        return @dataBuffer.scan(/\w/)
    end

    def parseChars(arr, limit)
        charArray = []

        arr.each_with_index { |char, index|
            if index < limit
               charArray.append(char)
            elsif
                if checkCharsUnique(charArray, limit)
                    return getSubstringPosition(charArray, limit)
                else
                    charArray.shift
                    charArray.append(char)
                end    
            end
        }

        return -1
    end

    def getSubstringPosition(arr, limit)
        str = ""
        arr.each{ |char|
            str += char
        }

        return @dataBuffer.index(str) + limit
    end

    def checkCharsUnique(arr, limit)
        uniqueArr = arr.uniq
        return uniqueArr.length == limit
    end

    def parseBuffer(limit)
        parseFile()
        splitArr = splitStringArray()
        puts parseChars(splitArr, limit)
    end
end

fileName = "real.txt"
instance = Day6.new(fileName)
instance.parseBuffer(14)