
def directoriesActions
  # change directory
  Dir.chdir("C:/")
  # create directory
  Dir.mkdir("C:/RubyTestDir") # optional second param is file rights like 755
  # iterate over directory
  Dir.foreach("C:/Windows/") do |entry|
      puts entry
  end
  # ... or even shorter way to show directory contents
  puts Dir["/usr/bin/*"]
  # get current directory
  puts Dir.pwd
  # delete directory
  Dir.delete("C:/somethingUnimportant")
end
  
def createTmpFile
    require 'tempfile'
    f = Tempfile.new('tingtong')
    f.puts "Hello"
    puts f.path
    f.close
end