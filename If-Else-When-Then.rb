#!/usr/bin/env ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

############### if / else ##################
def ifElse(str = "") # default argument values can be defined like in PHP
  int = 33
  float = 0.22
  ###### TERNARY OPERATOR:  condition ? if_true : if_false ####
  puts int < 40 ? "#{int} < 40" : "#{int} > 40"
  #### REGULAR IF/ELSE ####
  if ((1..10) === 15)
        puts "15 lies in (1..10)"
  # if you want to put instruction in the same line as condition type 'then'
  elsif str.nil? then return "ELSEIF-NIL"
  # you don't need parentheses here, but you can add them
  elsif str == "x" && float == 11 or int == 33
        return "ELSIF"
  else
      # you can return value omitting return statement
      # which is confusing for Java/PHP programmers
      "ELSE" 
  end
end
#puts ifElse("TEST_STR") # function can be called with or without parentheses
#puts ifElse

############# FAST CONDITIONALS SYNTAX ############
############# FAST CONDITIONALS SYNTAX ############
############# FAST CONDITIONALS SYNTAX ############
############# FAST CONDITIONALS SYNTAX ############
def fastConditionals
    arr = 0
    # assign [] if arr1 WASN'T SET
    arr2 = arr || [] 
    puts "arr2 = " + arr2.to_s # arr2 = 0
    #### WARNING SOME EMPTY CONSTRUCTS EVALUEATES TO TRUE
    if [] then puts "Empty array evaluates to true" end
    if 0 then puts "0 evaluates to true" end
    if "" then puts "Empty string evaluates to true" end
    #### TIP: CHECK EVERY EMPTY VALUE USING empty? or zero? ####
    if [].empty? then puts "AGAIN: Empty array evaluates to true" end
    if 0.zero? then puts "AGAIN: 0 evaluates to true" end
    if "".empty? then puts "AGAIN: Empty string evaluates to true" end
    #### SMART ASSIGNMENT - WORKS LIKE TERNARY OPERATOR #####
    arr2[:path] = if 2 > 1
                        "path1"
                    else
                        "path2"
                    end
    ##### SMART ASSIGNMENT USING CASE #######################
    someString = "Nice string"
    arr2[:what] = case someString
                    when /\w+/
                        "STR"
                    when /\d+/ then "DITITS"
                    else 
                         "NOT-RECOGNIZED"
                    end
end
fastConditionals