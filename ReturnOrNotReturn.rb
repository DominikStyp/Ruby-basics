#!/usr/bin/env ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

def doSomething(str)
   puts "do Something " + str
   return "I'm returning: " + str
end

# difference betwin returning or not returning from the function is simple:
# if you don't define return statement - VALUE OF THE LAST EXECUTED LINE in the function will be returned
# in this case 'nil' will be returned at the end of the function, 
# but if it was number or string - it's value would be returned
def test
   x = 2
   y = 5
      if y > x
         if (y-1) > x
            # if we add 'return' it will stop here
            # but if we leave it as it is, it will go further
            doSomething "1" 
         end
         if (y-2) > x
            doSomething "2"
         end
         if (y-3) > x
            doSomething "3"
         end
      end
      if y > x
         doSomething "4"
      end
      nil
end

puts test

# you can return multiple values using method
def returnMultipleValues   
   return 1,2,3
end
xx = returnMultipleValues
puts xx.class # It tells you that returned object is an array
