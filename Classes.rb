=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

##################### CLASSES ########################################
##################### CLASSES ########################################
##################### CLASSES ########################################
##################### CLASSES ########################################

puts "------------------ CLASSES - PERSON --------------------------- "
class Person
    attr_accessor :age # this param is accessible via read/write
    attr_reader :readonlyParam # this is read-only parameterer
    attr_writer :writeonlyParam # this is write-only parameter
    @readonlyParam = 5
    @writeonlyParam = 20
    #constructor
    def initialize(name, age)
      @name = name.to_s # @ = instance variable
      @age = age.to_i # convert to integer
      # this can be written as:
      # @name, @age = name.to_s, age.to_i
      
      # in class you can write to read-only param
      @readonlyParam = 10
      # in class you can read from write-only param
      puts "Write-only param: " + @writeonlyParam.to_s; 
    end
    # getter
    def getName
      return @name
    end
    # setter
    def setName(name)
       @name = name.to_s
    end
    # to string (like __toString() in PHP or toString() in Java)
    def to_s
        return "Person: #{@name} Age: #{@age} "
    end
    
    # variable number of arguments
    def variableNumberOfArguments (*test)
        puts "Number of parameters #{test.length}"
        for i in test
           puts "The parameters are #{i}"
        end
    end
        
    # you can even pass expressions as method parameters
    def defaultArguments (x = 22, y = x + 20, z = 50)
        puts "x = " + x.to_s
        puts "y = " + y.to_s
        puts "z = " + z.to_s
    end
    

    
    ########### GLOBAL VARIABLE IS STARTED BY $ ###############
    $globalVar = "This is global var"
end



# Inheritance
class Man < Person
    # this is how we can create alias to a method 'defaultArguments'
    # so that invoke '_da' will work as invoke 'defaultArguments'
    # it is very useful when you have long method names,
    # for example from parent class and you want to shorten them
    alias _da defaultArguments
end

############## TEST ########
if true
    personObj = Man.new("Ann", 22)
    puts "Person name: " + personObj.getName
    personObj.setName("Mary Ann")
    print "Person age: " + personObj.age.to_s
    puts "\n" + personObj.to_s
    # ERROR - write only
    # puts personObj.writeonlyParam;
    # ERROR - read only
    # personObj.readonlyParam = 10;
    puts $globalVar
    personObj._da
end
############################



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
# STATIC
StaticMethods.static1
# INSTANCE
obj = StaticMethods.new
obj.instance1
puts "OUTSIDE-INSTANCE: name=" + obj.name
puts "OUTSIDE-STATIC: name=" + StaticMethods.surname
puts "My job is: " + StaticMethods::MYCONST

