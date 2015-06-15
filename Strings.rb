############### string simple stuff #########  
# http://ruby-doc.org/core-2.2.0/String.html
def str(mystr = "")
    mystr += ""; #semicolon works like in JavaScript
    puts "Str len: " + mystr.length.to_s
    puts "Capitalize/Downcase: " + mystr.capitalize + "|" + mystr.downcase
    puts "Count occurences (vowels): " + mystr.count("aeiou").to_s
    puts "Delete specified chars: " + mystr.delete("o1").to_s
    puts "Ends with? " + mystr.end_with?("3").to_s
    # JavaScript like split
    puts "Split: " + mystr.split(" ")[3]
    # Extracting substring
    puts mystr[1] #get 2nd letter
    puts mystr[1..4] # range from 2 to 4 letter (included)
    puts mystr[-3, 2] # from 3rd letter off the back get 2 letters
    puts mystr[-3..-2] #like previous ex.
    puts "x".ord # 120 - ASCII number   
    puts "Interpolation test : #{mystr}"
    @x = 10
    puts "Interpolation of instance variables doesn't require braces: #@x"
    # Heredoc (PHP like)
    puts <<END
Sample string inside heredoc test str: "#{mystr[1..4]}"
END
end 
str("My name is Doom123")
