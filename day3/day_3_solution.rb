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

    def getCommonCharTwo(strArr)
        return strArr[0] & strArr[1]
    end

    def getCommonCharThree(strArr)
        return strArr[0] & strArr[1] & strArr[2]
    end

    def getStringHalves(str)
        s1 = str[0, str.length/2]
        s2 = str[str.length/2, str.length]

        return [s1, s2]
    end

    def getUniqueCharsTwo(strArr)
        uniqueStr0 = strArr[0].chars.to_a.uniq
        uniqueStr1 = strArr[1].chars.to_a.uniq
        uniqueStr1.pop

        return [uniqueStr0, uniqueStr1]
    end

    def getUniqueCharsThree(strArr)
        uniqueStr0 = strArr[0].chars.to_a.uniq
        uniqueStr1 = strArr[1].chars.to_a.uniq
        uniqueStr2 = strArr[2].chars.to_a.uniq
        uniqueStr0.pop
        uniqueStr1.pop
        uniqueStr2.pop

        return [uniqueStr0, uniqueStr1, uniqueStr2]
    end

    def question1
        running_total = 0

        File.readlines(@fileName).each do |line|
            strArr = getStringHalves(line)
            uniqueArr = getCommonCharTwo(getUniqueCharsTwo(strArr))
            running_total += getCharScore(uniqueArr)
        end

        puts running_total
    end

    def question2
        running_total = 0
        counter = 0
        threeArr = []

        File.readlines(@fileName).each do |line|
            counter += 1
            threeArr.append(line)
            
            if counter != 0 && counter % 3 == 0
                arr = getUniqueCharsThree(threeArr)
                char = getCommonCharThree(arr)
                running_total += getCharScore(char)
                threeArr = []
            end
        end

        puts running_total
    end
end

fileName = "real.txt"
game1 = Day3.new(fileName)
game1.question1
game1.question2