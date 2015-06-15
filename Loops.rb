=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

############### LOOPS #########
def loops
    # Perl like quote words: qw(aa bb cc dd)
    words = %w[first second third fourth fifth sixth]

    # >>> SIMPLEST LOOPS
    puts "--------- Simplest loops: ----------"
        # times
          3.times do print "3.times, "; end
        # prints from 3,4,5,6,7
          3.upto(7) { |x| print "#{x},"; }
        # prints 15,14,13,12 (same as above but different syntax form)
          for x in 15.downto(12) do print "#{x},"; end
        # prints 0,5,10,15,20
          0.step(20,5) { |z| print "#{z},"; }
        # prints 1,2,3
          for x in 1..3 do print "#{x},"; end
        # each 
          (0..2).each do |x| print "#{x}-each-do, "; end
          (3..5).each {|x| print "#{x}-each-do, "; }

    # >>> EACH LOOP
    puts "--------- Each loop with keys: -------------"
    words.each { |val| print val + ", " }; puts "" # prints new line
    puts "--------- Each loop with key => value pairs: -----------"
    words.each { |key, val| print key.to_s + " => " + val.to_s }

    # >>> FOR LOOP
    puts "--------- For loop: "
    # WARNING: key in this construct doesn't work for arrays (only hashes)
    for key, val in {1 => "a","b" => 2, 3 => "c"} # loop over hash
        puts "Index:" + key.to_s + " value: " + val.to_s
    end

    # >>> EACH WITH INDEX (like foreach in php)
    puts "--------- Each with index: "
    ["x","y","z"].each_with_index do |val, key| #WARNING: value is first, key is second
        puts "Index:" + key.to_s + " value: " + val.to_s
    end

    # >>> WHILE LOOP (UNTIL IS WHILE OPPOSITE)
    puts "--------- While loop shrinking array dynamically"
    arr = ["great","job","Ruby","developers","!!"]
    while x = arr.shift
        puts "Value: " + x.to_s
    end

    # >>> DO-WHILE COUNTERPART
    x = 0;
    begin
      puts "Hello...from do-while"
      x += 1;
    end while (x < 2)
    
    # >>> LOOP DO
    puts "--------- Loop do with break"
    x = 0
    loop() do # or loop do without parentheses
        print x
        # like in other languages
        if (x+=1) == 10
          break
        end
        # short version:
        #   break if (x+=1) == 10
    end
    
end
loops
