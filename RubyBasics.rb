#!/usr/bin/env ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

############### concatenetion operators #########
def concatenationOperators
    ff = ["Jay", "Silent Bob"]
    ff << "Darth Vader" # works like: ff.push("Darth Vader")
    puts ff.to_s
    puts "Concat " << "some " + "string " << "for " + "me"
end
#concatenationOperators


############### conditional assignment ######### 
def conditionalAssignment
    x = 1
    # this means "if x hasn't been set - set it to 2"
    x ||= 2
    # above can be replaced by...
    x = x.nil? ? 2 : x
    puts x
end
#conditionalAssignment




##################### SYMBOLS #######################################
##################### SYMBOLS #######################################
##################### SYMBOLS #######################################
##################### SYMBOLS #######################################
##################### SYMBOLS #######################################
def symbols
    # let's see how many symbols are there
    puts Symbol.all_symbols.size # 3664
    # let's check if x is there
    puts Symbol.all_symbols.include?(:x) # true
    puts Symbol.all_symbols.include?(1)  # false
    ### debugging object ids
    test = { "one" => 1, "two" => 2, "one" => 1 }
    # [21721572, 21721560] "one" is duplicated so it's not added to the hash
    print test.keys.map(&:object_id) 
end
symbols



############### RUBY TRICKS ###########################################
############### RUBY TRICKS ###########################################
############### RUBY TRICKS ###########################################
############### RUBY TRICKS ###########################################
############### RUBY TRICKS ###########################################
############### RUBY TRICKS ###########################################

def tricks
   # random number
   rand(10..20) # prints between 10 and 20
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

# optional parameters can be defined dynamically if you won't pass them to the method
def useParams(a, b = a * 10, c = a + 1)
        puts "a=" + a.to_s + ", b=" + b.to_s + ", c=" + c.to_s
end
useParams 1 # a=1, b=10, c=2
useParams 1, 2 # a=1, b=2, c=2

'''
 Looking for resource locations
 require "ap"
 p method(:ap).source_location # this gives you system path to the resource
'''

def failCheck
    x = 3
    # throws an exception
    fail "Oh NO!" if x > 10
    fail "Again NO!" if x < 5 
    
end


