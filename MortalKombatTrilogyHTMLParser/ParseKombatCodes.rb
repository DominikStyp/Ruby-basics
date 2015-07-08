class ParseKombatCodes
  
    def initialize(name)
        @fileArr = File.readlines(File.dirname(__FILE__) + "/" + name)
        @output = ""
    end
    
    def parse()
        @num = 1
        @fileArr.each {
           |line| 
           parseLine(line)
        }
        puts @output
    end
    
    def tab
      "\t\t\t\t"
    end
    
    def parseLine(line)
        if(line.match(/^\s+/))
            line.gsub!(/^\s+/,"").gsub!(/[\n\r]+/,"")
            arr = line.split(":")
            if(!arr[0].nil?)
               @output += tab() + "; "  + arr[1].to_s + " " + arr[0].to_s + "\n"
               @output += tab() + "_code#{@num} := \"" + parseCode(arr[1]) + "\" \n"
               @num += 1
            end
        else 
            line.gsub!(/[\n\r]+/,"")
            @output += tab() + ";;;;;;;;;;; #{line} ;;;;;;;;;;;;\n"    
        end
    end
    
    # 123-456
    # P1 Low Punch , P1 Block , P1 Low Kick - P2 Low Punch , P2 Block , P2 Low Kick
    def parseCode(code)
        out = ""
        code[0].to_i.times { out += "HP,"}
        code[1].to_i.times { out += "HK,"}
        code[2].to_i.times { out += "LK,"}
        # Player 2
        code[4].to_i.times { out += "P2-HP,"}
        code[5].to_i.times { out += "P2-HK,"}
        code[6].to_i.times { out += "P2-LK,"}
        return out[0...-1]
    end
    
end


o = ParseKombatCodes.new("KombatCodes.txt")
o.parse()