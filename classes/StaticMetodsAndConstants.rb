=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end


class StaticMethods
    def self.static1(*args)
        puts args.each_with_index { |arg, index| puts "Argument #{index} = #{arg}"; }
    end
end



########################## STATIC / INSTANCE VARIABLES, CONTSTANTS #######################

# WARNINGS!!!
# 1) @name instance variable value MUST BE set in initialize() method
# 2) @@surname static variable MUST BE initialized at the top of the class
class StaticMethods
    # this MUST BE defined if you want to reach variable outside the class
    # using: obj.name
    attr_accessor :name
    @name = "John" # instance
    @@surname = "Rambo" # static
    MYCONST = "KILLER" # constant
    
    def initialize
       @name = "John"
    end
 
    # Static test
    def self.static1()
        puts "STATIC:My surname is: " + @@surname
        puts "STATIC:My name is: " + @name
    end
    
    # Static getter
    # If you want to access static variable outside the class
    # you MUST define getter like below
    def self.surname
         return @@surname
    end
    # Static setter
    def self.surname=(val)
        @@surname = val
    end
    
    # Instance method
    def instance1
         puts "INSTANCE:I am " + __method__.to_s + ", my name is: " + @name.to_s
    end
end

# INSTANCE
obj = StaticMethods.new
obj.instance1
puts "OUTSIDE-INSTANCE: name=" + obj.name
puts "OUTSIDE-STATIC: name=" + StaticMethods.surname
puts "My job is: " + StaticMethods::MYCONST
# STATIC
StaticMethods.static1