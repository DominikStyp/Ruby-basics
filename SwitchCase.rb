###############  SWITCH / CASE constructs ###############
def switchCaseConstruct
    x = 10
    case x
          when 1..5
              puts "It's between 1 and 5"
          when 6
              puts "It's 6"
          when String
              puts "You passed a string"
          else
              puts "You gave me #{x} -- I have no idea what to do with that."
    end
end
#switchCaseConstruct