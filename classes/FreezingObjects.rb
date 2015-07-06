=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

# If you use freeze method on the object, none of it's values can be modified
# If you try to do so - you'll get a RuntimeError
class FreezeEx
   attr_accessor :value
   
   def initialize(value)
      setValue(value)
   end
   
   def setValue(value)
     @value = value
   end
  
   def getValue()
     @value
   end
end

####### TEST ########

obj = FreezeEx.new(10)
obj.value = 20
puts "step1 FreezeEx value is: " + obj.value.to_s
obj.setValue(30)
puts "step2 FreezeEx value is: " + obj.getValue().to_s
### let's freeze object
obj.freeze
### le'ts test again
puts "step3 FreezeEx value is: " + obj.getValue().to_s
obj.value = 20 # FreezingObjects.rb:33:in `<main>': can't modify frozen FreezeEx (RuntimeError)
obj.setValue(30)
