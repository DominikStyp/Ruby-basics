#!/usr/bin/ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

begin
   file = open("/unexistant_file")
   if file
      puts "File opened successfully"
   end
rescue
   fname = "existant_file"
   retry
end

# raise example
begin  
  raise 'A test exception.'  
rescue Exception => e  
  puts e.message  
  puts e.backtrace.inspect  
end  


# USAGE OF RAISE - different versions
raise 
raise "Error Message" 
raise ExceptionType, "Error Message"
raise ExceptionType, "Error Message" if 2 > 1

# TRY-CATCH AND THROW
throw :lablename
#.. this will not be executed
catch :lablename do
#.. matching catch will be executed after a throw is encountered.
end


# USAGE OF ENSURE - FINALLY COUNTERPART
begin 
   #.. process 
   #..raise exception
rescue 
   #.. handle error 
ensure 
   #.. finally ensure execution
   #.. This will always execute.
end
