#!/usr/bin/env ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

def defaultArguments (x = 22, y = x + 20, z = 50)
        puts "x = " + x.to_s
        puts "y = " + y.to_s
        puts "z = " + z.to_s
end

alias da defaultArguments

da
da
