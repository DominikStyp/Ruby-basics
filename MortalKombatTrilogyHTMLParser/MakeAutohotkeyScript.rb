=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
  
  This class parses XML file using Nokogiri parser
=end

require 'rubygems'
require 'nokogiri'

class MakeAutohotkeyScript
    
    def initialize(file = getXMLFilePath())
        f = File.open(file)
        @doc = Nokogiri::XML(f)
        f.close
    end
    
    def getXMLFilePath
       File.dirname(__FILE__) + "/xml/MortalKombatTrilogy.xml"
    end
    
    def parseDoc
        @charactersNames = []
        @doc.xpath("//characters//character").each {
            |char|
            #name = char>("name") # CSS way
            name = char.xpath("name").text
            @charactersNames << name
            specialMoves = prepareSpecialMoves(char)
            combos = prepareCombos(char)
            finishingMoves = prepareFinishingMoves(char)
            autoHotkeyScript = prepareAutokeyClass(name, combos, specialMoves, finishingMoves)
            puts autoHotkeyScript
            puts "\n\n"
            puts getCharacterNamesList()
        }
    end
    
    def lsp
        return "\n                "
    end
    
    
    def getCharacterNamesList(separator = "|")
        @charactersNames.join(separator)
    end
    
    def parseKeys(obj)
        keys = obj.xpath("keys//all").text
        if(keys.length < 1)
          keys = obj.xpath("keys//pc").text
        end 
        keys.gsub("thenrelease","Release ").gsub("release","Release ").gsub("Hold","Hold ")
    end
    
    def clearCharacterName(charName)
        return charName.gsub("-","").gsub(/\s+(\w{1})/) { |x| $1.upcase }
    end
    
    def prepareSpecialMoves(char)
            str = ""
            cnt = 1
            char.xpath("moves//specialMoves").each {
                |s|
                name = s.xpath("name").text
                note = s.xpath("note").text
                keys = parseKeys(s)
                str +=  lsp() + "; " + name
                if(note.length > 0)
                   str += lsp() + "; " +  note 
                end
                str += lsp() + "_special" + cnt.to_s + " := " + "\"#{keys}\"" 
                cnt += 1
            }
            # Shang Tsung exception - conversion morphs into specials 
             char.xpath("moves//morphs").each {
                      |s|
                      name = s.xpath("name").text
                      note = s.xpath("note").text
                      keys = parseKeys(s)
                      str +=  lsp() + "; " + name
                      if(note.length > 0)
                         str += lsp() + "; MORPH " +  note 
                      end
                      str += lsp() + "_special" + cnt.to_s + " := " + "\"#{keys}\"" 
                      cnt += 1
                  }
            str
    end
    
    def prepareCombos(char)
                 str = ""
                 cnt = 1
                 char.xpath("moves//combos").each {
                     |s|
                     note = s.xpath("note").text
                     keys = parseKeys(s)
                     if(note.length > 0)
                        str += lsp() + "; " +  note 
                     end
                     str += lsp() + "_combo" + cnt.to_s + " := " + "\"#{keys}\"" 
                     cnt += 1
                 }
                 str
    end
    
    def prepareFinishingMoves(char)
                       str = ""
                       char.xpath("moves//finishingMoves").each {
                           |s|
                           name = s.xpath("name").text.downcase.gsub(/\s+/,"")
                           note = s.xpath("note").text
                           keys = parseKeys(s)
                           if(note.length > 0)
                              str += lsp() + "; " +  note 
                           end
                           # fatality without number ?
                           if(name.match("fatality") && !name.match(/\d+/))
                               name += "1"
                           end
                           str += lsp() + "_" + name  + " := " + "\"#{keys}\"" 
                       }
                       str
    end
    
    
    
=begin
    Class should be prepared as follows:
      ; combos
      _combo1 := ""
      _combo2 := ""
      _combo3 := ""
      _combo4 := ""
      _combo5 := ""
      _combo6 := ""
      _combo7 := ""
      _combo8 := ""
      _combo9 := ""
      _combo10 := ""
      ; special moves
      _special1 := ""
      _special2 := ""
      _special3 := ""
      _special4 := ""
      _special5 := ""
      _special6 := ""
      _special7 := ""
      _special8 := ""
      _special9 := ""
      _special10 := ""
      ; finishing moves
      _fatality1 := ""
      _fatality2 := ""
      _brutality := ""
      _babality  := ""
      _friendship := ""
      _animality := ""
      _stage := "" 
=end    

    def prepareAutokeyClass(charName, combos, specialMoves, finishingMoves)
        charName = clearCharacterName(charName) 
        str = <<END
        class #{charName} extends MKTrilogyCharacter {
                ;;;;;; combos ;;;;;;;; #{combos}
                ;;;;;; special moves ;;;;;;; #{specialMoves}
                ;;;;;; finishing moves ;;;;; #{finishingMoves}
        }
END
     str
    end
    
    
end # end class


obj = MakeAutohotkeyScript.new
obj.parseDoc