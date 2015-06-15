
######### REGULAR EXPRESSIONS ################
def regularExpressions
    # Tricky checking substring presence (may not work before Ruby 1.9.3)
    puts "some test 222 string"["222"] # returns substring "222"
    puts "some test 111 string"["222"] # returns NIL
    
    # Substitution
    puts "something new".sub("new", "old") # "something old"    
    # Global Substitution
    puts "new something new".gsub("new","old") # "old something old"
    puts " this is my >password< ".gsub(/>(\w+)</,"__\\1__") #  this is my __password__ 
    # Wrapping using scan - every word will be wrapped in <<>>
    # <<some>> <<words>> <<wrapped>>
    "some words wrapped".scan(/\w+/) {|w| print "<<#{w}>> " }; print "\n"
    # use scan to find phone numbers
    # Phone: 600-333-222 Phone: 333-222-333
    "my phone 600-333-222 and my is 333-222-333".scan(/[0-9-]+/) { |x| puts "Phone: #{x}" }
    # Regex match
    if !mystr.match(/[0-9]{3}/).nil?
      puts "String matched regex /[0-9]{3}/"
    end
    ### Replace with callback
    # I wanna change all letters in my secret password to *
    # "my secred pass is ********" - changes full expression to *
    "my secred pass is @myPass@".gsub(/@[^@]+@/) { |m| m.gsub(/./,"*") }
    # "my secred pass is >******<" - $1 perl-like first atom
    # you can use Regexp.last_match[1] instead which is the same as $1
    "my secred pass is @myPass@".gsub(/@([^@]+)@/) { |m| ">" + $1.gsub(/./,"*") + "<" }
    # more atoms and dynamic changes
    # "For me MARCH 2014 was a good month"
    'For me March 2013 was a good month'.gsub(/(\w+) (\d+)/) { |m, y| $1.to_s.upcase + " " + $2.to_i.next.to_s }  
end