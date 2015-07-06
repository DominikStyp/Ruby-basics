=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

class AllocateTest
    @val = -1
    def initialize(val)
      @val = val.to_i      
      puts "From initialize()"
    end
    def getVal()
      @val.to_s
    end
end

####### TEST #####
obj = AllocateTest.new(10)
obj1 = AllocateTest.allocate

# As we can see -1 won't be initialized and constructor won't be called during 'obj1' allocation
puts "obj.getVal(): "  + obj.getVal # obj.getVal(): 10
puts "obj1.getVal(): " + obj1.getVal # obj1.getVal(): 

