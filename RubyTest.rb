#!/usr/bin/env ruby

def doSomething(str)
   puts "do Something " + str
   return "I'm returning: " + str
end

def test
   x = 2
   y = 5
      if y > x
         if (y-1) > x
            # if we add return it will stop here
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
end

puts test
