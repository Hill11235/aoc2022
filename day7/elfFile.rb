class ElfFile

    def initialize(name, size, parentDir)
        @name = name
        @size = size
        @parentDir = parentDir
    end

    def parentDir
        @parentDir
    end

    def size
        @size
    end

    def print
        puts "name: #{@name}, size: #{@size}, parentDir: #{@parentDir}"
    end
end