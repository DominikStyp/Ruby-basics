
# http://ruby-doc.org/core-2.2.0/Array.html
def arrays
    arr = ["one", "two", "three", "four", "five"]
    arrFilled = Array.new(30, 0) # automatic fill
    puts arr[-2]; # "four"
    puts arr[0]; # "one"
    puts arr[1..-3].to_s; # ["two", "three"]
    puts "Array length:" + arr.length.to_s + " or " + arr.count.to_s
    puts "Third element is: #{arr[2]}"; # PHP-like interpolation
    puts "Add element and retrieve it: " + arr.push("six")[-1].to_s # same as: arr << "six"
    #puts "Pushed element is: " + arr[-1]
    
    # getting unique elements
    puts [0,1,1,2,3,3,4,5,6,3,7,8].uniq.to_s # [0, 1, 2, 3, 4, 5, 6, 7, 8]
    
    puts "------ mapping array ----- "
    puts (arr.map  { |a| a += "..." }).to_s # without affecting original
    puts (arr.map! { |a| a = "<<#{a}>>" }).to_s # ! affects original
    
    # comparing two arrays
    puts "Common elements: " + ( [0,2,3] & [3,4,5] ).to_s
    puts "Different elements: " + ( [0,2,3] - [2,3,4] ).to_s
    puts "Combine arrays: " + ( [0,2,3] + [2,3,4] ).to_s
    
    # Combined comparison operator <=> returns -1/0/1 for: lower/equal/bigger value
    puts "Custom sort of the array: " + ( [0,2,1,8,7,5,3].sort { |x,y| x <=> y } ).to_s
    
    # mapping array and copy into another on-the-fly
    z = [1,2,3].collect{ |x| 10*x }
    puts z # [10,20,30]
    
    # you can change array value separator (taken from Perl)
    $, =", "   # Array value separator
    range1 = (1..10).to_a # 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    
end
#arrays



############### multidimensional array #########
# Multidimensional arrays
def multidimArray
    # fill multidimensional
    puts "----------- Multi-dimensional arrays -------------- "
    empty_table = Array.new(3) { Array.new(3) }
    Array({:a => "a", :b => "b"}) #=> [[:a, "a"], [:b, "b"]]
    number_array = [ [1,2,3], [4,5,6] ]
    puts number_array.to_s
end
#multidimArray


############### hashes #########
def hashes
    puts "-------- hashes ------------"
    puts options = { :font_size => 10, :font_family => "Arial" } # symbols
    puts options = { font_size: 10, font_family: "Arial" } # same as above
    books         = {}
    books[:xxx]  = "Some key"
    # Comparing
    h1 = { "a" => 1, "c" => 2 }
    h2 = { 7 => 35, "c" => 2, "a" => 1 }
    h3 = { "a" => 1, "c" => 2, 7 => 35 }
    h4 = { "a" => 1, "d" => 2, "f" => 35 }
    h1 == h2   #=> false
    h2 == h3   #=> true - intelligently checks if keys & values are the same
    h3 == h4   #=> false
    # Enumerable functionality
    people = { :fred => 23, :joan => 18, :anna => 22, :pete => 54 }
    # If you want sort by 'age' you MUST put it into pipes |age| - otherwise error will rise
    puts people.sort_by { |name, age| age }.to_s # => [[:joan, 18], [:fred, 23], [:pete, 54]]
    puts people.select { |name, age| age > 18 }.to_s
end
#hashes