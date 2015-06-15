=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

### Debugging object
def d(obj)
    return obj.nil? ? "There is no object!" : obj.display_info()
end

def debuggingObject
    arr = [
      "string", 2, 3.22, false, nil, fun = lambda {}, [], {},
       words = %w[first second], /[a-z]{3}/
    ]
    arr.each {|var| puts "Class is: " + var.class.to_s}
end
debuggingObject