=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

=begin     
  Pry-Byebug is a gem that extends Pry
  Adds step, next, finish and continue commands and breakpoints to Pry using byebug.
  Link to Github repo of the project:
  https://github.com/deivid-rodriguez/pry-byebug
  Simple usage of Pry without other gems is in file "PryDebuggingExample.rb"
  In order to use this you must first install following gems (commands below):
  $ gem install pry
  $ gem install byebug
  $ gem install pry-byebug
=end


def testLoop
   v1 = "This is string variable"
   v2 = 0
   10.times do
        puts "Before pry inject"
        v2 = v2+2
        binding.pry
        puts "After pry inject"
        v1 = v1 + rand(0...10).to_s + "_"
   end
end




=begin
   Below is the output from pry console during debugging this file inside loop using following command in cmd:
   $ cd C:/RubyLanguageIssues/examples/
   $ pry -r ./PryByebugExample.rb
   
   
   From: C:/RubyLanguageIssues/examples/PryByebugExample.rb @ line 25 Object#testLoop:

    19: def testLoop
    20:    v1 = "This is string variable"
    21:    v2 = 0
    22:    10.times do
    23:         puts "Before pry inject"
    24:         v2 = v2+2
 => 25:         binding.pry
    26:         puts "After pry inject"
    27:         v1 = v1 + rand(0...10).to_s + "_"
    28:    end
    29: end
[9] pry(main)> continue

From: C:/RubyLanguageIssues/examples/PryByebugExample.rb @ line 26 Object#testLoop:

    19: def testLoop
    20:    v1 = "This is string variable"
    21:    v2 = 0
    22:    10.times do
    23:         puts "Before pry inject"
    24:         v2 = v2+2
    25:         binding.pry
 => 26:         puts "After pry inject"
    27:         v1 = v1 + rand(0...10).to_s + "_"
    28:    end
    29: end
[9] pry(main)> v1
=> "This is string variable9_"
[10] pry(main)> v2
=> 4
[11] pry(main)> continue
After pry inject
Before pry inject

From: C:/RubyLanguageIssues/examples/PryByebugExample.rb @ line 26 Object#testLoop:

    19: def testLoop
    20:    v1 = "This is string variable"
    21:    v2 = 0
    22:    10.times do
    23:         puts "Before pry inject"
    24:         v2 = v2+2
    25:         binding.pry
 => 26:         puts "After pry inject"
    27:         v1 = v1 + rand(0...10).to_s + "_"
    28:    end
    29: end
[11] pry(main)> v1
=> "This is string variable9_0_"
[12] pry(main)> v2
=> 6
   
   
     
=end