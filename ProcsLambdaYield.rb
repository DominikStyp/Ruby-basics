
=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

############ USING YIELD KEYWORD #############
############ USING YIELD KEYWORD #############
############ USING YIELD KEYWORD #############
############ USING YIELD KEYWORD #############

def yieldKeyword(param = "defaultVal", param1 = "defaultVal_1")
    puts "Inside method: #{param}, #{param1}"
    yield # no params means that no values are passed to the block
    yield(param, param1) # 2 values are passed to the block
    puts "Inside method again"
    yield("String",22)
end
# works like for loop here
puts  "--------- yieldKeyword -------------- "
yieldKeyword("first") { |n,m| puts "Inside block Params are: #{n}, #{m}" }


############ USING PROCS (reusable blocks) ############################################
############ USING PROCS (reusable blocks) ############################################
############ USING PROCS (reusable blocks) ############################################
############ USING PROCS (reusable blocks) ############################################
def procsTest
  arr = [0,1,2,19,17,3,4]
  puts arr.sort_by { |x,y| x <=> y }.to_s
  # but what if we want to reuse this sorting block ???
  sortingBlock = Proc.new { |x,y| x <=> y } # save block (object) into the variable
  puts "---------- Proc call 1 ----------"
  puts (arr.sort_by &sortingBlock).to_s # reuse it
  # proc IS THE SAME AS Proc.new
  selectBlock = proc { |x| (x < 2 or x > 17) or (x >= 2 and x <=3) }
  # select() method takes boolean as argument,
  # sort_by() method takes 0, 1, -1 values (equals, bigger, lesser)
  puts ((arr.select &selectBlock).sort_by &sortingBlock).to_s # reuse blocks
  puts "--- and proc .call() "
  puts selectBlock.call(1).to_s
end
#puts "----------- PROCS (AND LAMBDAS) USING -------------- "
#procsTest

def useProcAsArgument(&myDefProc)
        # Iterates over bytes in file
       file = File.open("testFile.txt", "r+")
       file.each_byte &myDefProc
       # it it was second argument example:
       # IO.foreach(@path, &myProc)
end

def differentProcSyntax
    # Here we have proc syntax call alternatives, all means the same but looks different
    myProc = Proc.new { |x| x += 10 }
    puts myProc.call(0) # first way
    # works in Ruby 2.2
    # puts myProc.(0) # second way
    puts myProc[0] # third way
    puts myProc === 0 # fourth way
end
#differentProcSyntax


############# LAMBDA is almost the same as proc) ###############
############# LAMBDA is almost the same as proc) ###############
############# LAMBDA is almost the same as proc) ###############
# ONE DIFFERENCE IS THAT LAMBDA CHECKS NUMBER OF ARGUMENTS
def lambdaTest
    fun = lambda { |x| x += 10; return x }
    puts "---------- lambdaTest ----------"
    puts fun.call(10).to_s
end
lambdaTest

######################## SYMBOL#to_proc ##########################
######################## SYMBOL#to_proc ##########################
######################## SYMBOL#to_proc ##########################
######################## SYMBOL#to_proc ##########################
# WARNING!!!
# &: proc to symbol is MUCH FASTER in runtime, than the standard proc
puts "-------------- SYMBOL#to_proc ------------"
def builtInProc
    arr = [1,3,4,5]
    # check if all numbers are even, different syntactic solutions
    arr.all? { |x| x.even? } # WAY 1: passing proc block
    arr.all?(&:even?)         # WAY 2: (faster) passing symbol to block
end
builtInProc

# here we "extend" base Fixnum class by defProc method
class Fixnum
    def defProc
        return self.to_i + 5
    end
end

def myOwnProcPass
    arr = [1,2,3]
    # defined our own proc
    localProc = Proc.new { |n| n-1 }
    #### use defined local proc object
    puts arr.map(&localProc).to_s   # [0,1,2]
    #### use defined 'on-the-fly' proc object
    puts (arr.map { |n| n+1 }).to_s # [2,3,4]
    #### use defined method AS proc object 'Symbol#to_proc'
    #### which returns Proc object that invokes a method, as named by the symbol
    puts arr.map(&:defProc).to_s    # [6,7,8]
end

def convertMethodToProc
    # convert: WAY 1
    m = method(:puts).to_proc
    # convert: WAY 2 (fast) 
    u = :upcase.to_proc
    # now we can use ist as built-in puts method
    m.call("--- Use it as puts function ---")
    puts u.call("--- Make it uppercase ---")
end
convertMethodToProc

def unpackProcArgs
    puts "----- unpackProcArgs -------- "
    p = Proc.new { |*args| puts args.to_s }
    p.call("a",11,2.33)
end
unpackProcArgs



#myOwnProcPass


#################  DIFFERENCE BETWEEN PROC & LAMBDA  #############
#################  DIFFERENCE BETWEEN PROC & LAMBDA  #############
#################  DIFFERENCE BETWEEN PROC & LAMBDA  #############
#################  DIFFERENCE BETWEEN PROC & LAMBDA  #############

# Main difference is that if you return something from LAMBDA you won't end function
# but if you return from PROC you immediatly end function
def test(p)
  print "Start"
  p.call
  print "End"
end

def program
    test lambda { print ", From lambda, "; return }# Start, From proc, End
    puts "\n ----------- "
    # return immediatly ends test() function
    test proc { print ", From proc, "; return } # Start, From proc, 
    puts ""
end

program

############# DYNAMICALLY CREATE A LAMBDA ############
############# DYNAMICALLY CREATE A LAMBDA ############
############# DYNAMICALLY CREATE A LAMBDA ############
############# DYNAMICALLY CREATE A LAMBDA ############
# this function returns dynamically created lambda function which gets specified parameter "times"
# and if called - it multiplies its first argument by "times" variable
def define_multiplicator(times)
   lambda { |number| number * times }
end
puts "\n --------- DYNAMICALLY CREATE A LAMBDA -------- "
times6 = define_multiplicator(6)
times7 = define_multiplicator(7)
puts times6.call(5) # 5 * 6 = 30
puts times7.call(5) # 5 * 7 = 35


######################## USING PROCS AS REFERENCE #############
######################## USING PROCS AS REFERENCE #############
######################## USING PROCS AS REFERENCE #############
######################## USING PROCS AS REFERENCE #############

# 1) We exdend built in Array
# 2) We use &b as a reference to the block that is used as argument
# 3) block is called by call, with argument x passed into it
# 4) this works very similar to the YIELD keyword 
class Array
    def shuffleMe(&b)
        shuffle.each {|x|  b.call x }
    end
end
puts "\n ------------ shuffleMe() ------------------"
puts ([10,33,22,11].shuffleMe { |y| y }).to_s




