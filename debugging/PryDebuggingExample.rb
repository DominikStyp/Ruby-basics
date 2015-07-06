
=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

=begin 
  

To run this in debugger you must do:
   - open terminal
   - go to directory with this file
   - type: 
          pry -r ./PryDebuggingExample.rb
   - if you are pry terminal type function name 
         [1] pry(main)> debugTest
         
   - you should see:
   
    41: def debugTest
    42:   x = 10
    43:   z = x + 20
    44:   str = "some string to test"
    45:   str.upcase!
    46:   5.times do
    47:     # here we can inject Pry
    48:     z = z + 1
 => 49:     binding.pry
    50:     puts "str=#{str}, x=#{x}, z=#{z}"
    51:   end
    52:
    53: end
    
    ...and line 20 is the line where pry has been injected
    so we can now check what's inside the variables:
    
    [1] pry(main)> str
    => "SOME STRING TO TEST"
    [2] pry(main)> z
    => 31
    
    ...as we expected, but what about the next loop iteration ?
    Although Pry doesn't support "next" in loops, you can use "exit trick"
    
    [2] pry(main)> exit
    
    this causes loop to do next iteration:
      
    46: def debugTest
    47:   x = 10
    48:   z = x + 20
    49:   str = "some string to test"
    50:   str.upcase!
    51:   5.times do
    52:     # here we can inject Pry
    53:     z = z + 1
 => 54:     binding.pry
    55:     puts "str=#{str}, x=#{x}, z=#{z}"
    56:   end
    57:
    58: end
    
    [1] pry(main)> z
    => 32
    
    ################### IF YOU WANT TO HAVE next STATEMENT IN LOOP CHECK OUT PryByebugExample.rb #########
    
      
=end

def debugTest
  x = 10
  z = x + 20
  str = "some string to test"
  str.upcase!
  5.times do 
    # here we can inject Pry
    z = z + 1
    binding.pry
    puts "str=#{str}, x=#{x}, z=#{z}"
  end
  
end

