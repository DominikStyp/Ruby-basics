#!/usr/bin/env ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

# Here we have some Ruby tricks that can make things easy like: 
# fast checking substring in string, easy debugging with 'p' etc.

def tricks
   # nice debugging
   p [1,2,3,4]
   # strange concatenating
   test = "a" "b" "c"
   puts test
   # simplest check if substring exists inside string
   puts "some test 222 string"["222"] # returns substring
   puts "some test 111 string"["222"] # returns NIL
   @x = 10
   puts "Interpolation of instance variables doesn't require braces: #@x"
   # convert into array
   c = 10
   puts c.to_s # 10
   puts [*c].to_s # [10]
   puts [c].to_s # [10]  
end
tricks

# Fast conditional assignment
def conditionalAssignment
    x = 1
    # this means "if x hasn't been set - set it to 2"
    x ||= 2
    # above can be replaced by...
    x = x.nil? ? 2 : x
    puts x
end


# optional parameters can be defined dynamically if you won't pass them to the method
def useParams(a, b = a * 10, c = a + 1)
        puts "a=" + a.to_s + ", b=" + b.to_s + ", c=" + c.to_s
end
useParams 1 # a=1, b=10, c=2
useParams 1, 2 # a=1, b=2, c=2

=begin
 Looking for resource locations
 require "ap"
 p method(:ap).source_location # this gives you system path to the resource
=end

def failCheck
    x = 3
    # throws an exception
    fail "Oh NO!" if x > 10
    fail "Again NO!" if x < 5 
    
end