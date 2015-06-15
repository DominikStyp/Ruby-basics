#!/usr/bin/ruby

# http://www.tutorialspoint.com/ruby/ruby_input_output.htm

class MyFiles
  attr_accessor :path
  def initialize(path)
     @path = path
  end
  # Reads number of chars from file
  def readNumOfChars(numOfChars)
      if numOfChars < 1 || !File.exist?(path)
        raise ArgumentError("number of chars cat't be smaller than 1")
      end
      file = File.open(@path, "r")
      return file.sysread(numOfChars)
  end
  # Writes chars into the file
  def writeChars(chars)
     file = File.open(@path, "w")
     return file.syswrite(chars)
  end
  # Iterates over bytes (takes proc as argument)
  def iterateOverBytes (&definedProc)
     file = File.open(@path, "r+")
     file.each_byte(&definedProc)
  end
  # Gets specified lines from the file (works like extracting elements from regular array)
  def readLines(from, to)
      arr = IO.readlines(@path)
      return arr[from,to]
  end
  # Iterate over all lines in specified file
  def iterateOverAllLines(&myProc)
      return IO.foreach(@path, &myProc)
  end
  def rename(newName)
      File.rename(@path,newName)
  end
  def delete
      File.delete(@path)
  end
  ### tests
  def exists?
      return File.exists?(@path)
  end
  def directory?
      return File.directory?(@path)
  end
  def empty?
      return File.zero?(@path)
  end
end

o = MyFiles.new("C:/_WAZNE/RubyProject1/!testFile.txt")
o.writeChars("Ruby is soo cool!!\nRuby is amazing\nRuby is great!\nRuby is masterpiece!\nRuby is better than PHP")
# o.iterateOverBytes { |char| print "#{char},"} # prints ASCII codes
# puts "\n-----------"
o.iterateOverBytes { |char| putc char; print ","} # prints ASCII codes
puts "\n-----------"
puts o.readLines(1,2).to_s 
puts o.iterateOverAllLines { |line| puts ">>> #{line}" }