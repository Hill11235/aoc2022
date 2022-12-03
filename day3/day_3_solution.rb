class Day3

    def initialize(fileName)
        @fileName = fileName
    end

    def getCharScore(strArr)
        str = strArr[0]
        lower = ("a".."z").to_a
        higher = ("A".."Z").to_a

        if lower.find_index(str) != nil
            return lower.find_index(str) + 1
        else
            return higher.find_index(str) + 27
        end

    end

    def getCommonChar(strArr)
        return strArr[0] & strArr[1]
    end

    def getStringHalves(str)
        s1 = str[0, str.length/2]
        s2 = str[str.length/2, str.length]

        return [s1, s2]
    end

    def getUniqueChars(strArr)
        uniqueStr0 = strArr[0].chars.to_a.uniq
        uniqueStr1 = strArr[1].chars.to_a.uniq
        uniqueStr1.pop

        return [uniqueStr0, uniqueStr1]
    end

    def runLoop
        running_total = 0

        File.readlines(@fileName).each do |line|
            strArr = getStringHalves(line)
            uniqueArr = getCommonChar(getUniqueChars(strArr))
            running_total += getCharScore(uniqueArr)
        end

        puts running_total
    end

end

fileName = "real.txt"
game1 = Day3.new(fileName)
game1.runLoop