
#!/usr/bin/env ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

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