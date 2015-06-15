=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

############# METAPROGRAMMING - YOUR OWN ACCESSORS #################
############# METAPROGRAMMING - YOUR OWN ACCESSORS #################
############# METAPROGRAMMING - YOUR OWN ACCESSORS #################
############# METAPROGRAMMING - YOUR OWN ACCESSORS #################
############# METAPROGRAMMING - YOUR OWN ACCESSORS #################

# Every object in Ruby is an object of class Class
# so if you define your own accessor like this, it will be available in other classes
class Class 
  def my_attr_accessor(*args)
      # iterate through each passed in argument...
      args.each do |arg|
          # getter
          self.class_eval("def #{arg}; @#{arg}; puts 'You trying to get the value: ' + @#{arg}.to_s;  end")
          # setter
          self.class_eval("def #{arg}=(val);@#{arg}=val;end")
      end
  end
end

class TestAccessor
    my_attr_accessor :test1, :test2
end

puts " --------------------- METAPROGRAMMING: Custom accessors -------"
obj = TestAccessor.new
obj.test1 = "Hello!";
puts obj.test1; # outputs "You trying to get the value: Hello!"



############### Type safe accessor example ###################

class Myclass
        def self.typesafe_accessor(name, type)
            define_method(name) do
              instance_variable_get("@#{name}")
            end
            define_method("#{name}=") do |value|
              if value.is_a? type
                instance_variable_set("@#{name}", value)
              else
                raise ArgumentError.new("Invalid Type")
              end
            end
        end
        typesafe_accessor :foo, Integer
end
# usage
f = Myclass.new
f.foo = 1
#f.foo = "bar" # an exception thrown here!

############ PREDEFINED VARS ###########################################

class SomeClass
    def self.methodDefined(*args)
            args.each { |arg|
                define_method(arg) {
                       __method__ # predefined
                }
            }
    end
    methodDefined :a, :b, :c
end

x = SomeClass.new
p x.a
p x.b
p x.c