=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

# This example shows how to overload mathematical operators on the object
# How it works:
# When you perform math operation on the object, new object is created
# with the new value provided to the constructor, 
# but first 'checkAge' is performed so you cannot set values out human age common range 
class PersonAge
  
  attr_accessor :age
  
  def initialize(age) # Initialize the width and height
    @age = age.to_i
    checkAge
  end

  def +(scalar)
    @age = @age + scalar
    checkAge
    PersonAge.new(@age)
  end

  def -(scalar)
    @age = @age - scalar
    checkAge
    PersonAge.new(@age)
  end

  def *(scalar)
    @age = @age * scalar
    checkAge
    PersonAge.new(@age)
  end
  
  def checkAge
    if (@age > 130)
       raise "People do not live longer than 130 years!"
    end
    if (@age < 0)
       raise "Age cannot be less than 0"
    end
  end
  
  def to_s
    @age.to_s
  end
  
end
############

ageObj = PersonAge.new(40)
ageObj = ageObj * 2
# "PersonAge is 80 "
puts "PersonAge is " + ageObj.to_s 
# Exception: OperatorsOverloading.rb:33:in `checkAge': Age cannot be less than 0 (RuntimeError)
ageObj = ageObj - 100

