
=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

# This class downloads all the Mortal Kombat Trilogy characters moves,
# and puts them into an XML file.
# What you need in this to work: Nokogiri (HTML Parser), Gyoku (Hash to XML converter)
# How to install Nokogiri: http://www.nokogiri.org/tutorials/installing_nokogiri.html 
require 'rubygems'
# Hash to XML converter
require 'gyoku'
# DOCUMENTATION TO NOKOGIRI PARSER
# http://www.rubydoc.info/github/sparklemotion/nokogiri/Nokogiri/HTML
require_relative 'GetNokogiriHTMLCachedDoc'


class ParseMKTrilogy

      def initialize
         @doc = ""
         @cacheFolder = "downloaded"
         @url = "http://www.mksecrets.net/index.php?section=mkt&lang=eng&contentID=4000"
         obj = GetNokogiriHTMLCachedDoc.new(@url, @cacheFolder)
         @doc = obj.getPage
      end
 
      def getCharacters
         # works like jQuery(selector)
         return @doc.css("div#content > article > p")
      end
      
      
      def characterToXML(character)
          Gyoku.xml(character)
      end
      
      def processAllCharacters
          characters = getCharacters()
          #processCharacter(characters[20])
          xmlSTR = ""
          characters.each { 
            |val| 
              char = processCharacter(val)
              next if char.nil?
              charXML = characterToXML(char)
              xmlSTR = xmlSTR + "<character>" + charXML.to_s + "</character>"
         }
         xmlSTR = "<characters>" + xmlSTR + "</characters>"
         File.write(File.dirname(__FILE__) + "/xml/MortalKombatTrilogy.xml", xmlSTR)
      end
      
      def processCharacter(character)
          if character.nil?
            return
          end
          # get pure text without html tags
          text = character.content
          # clear from additional new lines/caret returns
          text = text.gsub(/[\n\r]{1,}/,"\n")
          cName = getCharacterName(character)
          return nil if cName.nil?
          { name: cName, moves: parseCharacterData(text) }
      end  
      
      
      
      def getCharacterName(character)
          # works like .find("img") in jQuery
          img = character>("img")
          if img[0].nil? 
             return
          end
          img[0].attr("title").to_s
      end
      
      
      def parseCharacterData(text)
         parseType = -1
         # morphs are only for shang tsung
         parsedData = { note: "", specialMoves: [], finishingMoves: [], combos: [] }
         text.split("\n").each { 
           |line|
           _tmp = getParseType(line)
           if !_tmp.nil?
              parseType = _tmp
              #puts "Parse type: " + parseType.to_s
           end
           if parseType > 0
              parseByType(parsedData, parseType, line)
           end
         }
         parsedData
      end
      
      # parseType: 1-note, 2-special moves, 3-finishing moves, 4-Combos
      def getParseType(line)
           if(line.match(/Note:/))
               return 1
           end
           if(line.match(/Special Moves:/)) 
               return 2
           end
           if(line.match(/Finishing Moves:/)) 
               return 3
           end
           if(line.match(/Combos:/)) 
               return 4
           end
           # for Shang Tsung
           if(line.match(/Morphs:/)) 
               return 5
           end
           nil
      end
      
      def parseByType(parsedData, type, line)         
          # parseType: 1-note, 2-special moves, 3-finishing moves, 4-Combos
          case type
              when 1
                  parsedData[:note] = line.gsub("Note: ","")
              when 2
                  return if !checkBeginning(line)
                  parsedData[:specialMoves] << parseSpecialMoves(line, parsedData[:specialMoves].count)
              when 3
                  return if !checkBeginning(line) 
                  parsedData[:finishingMoves] << parseSpecialMoves(line, parsedData[:finishingMoves].count)
              when 4
                  return if !checkBeginning(line) 
                  parsedData[:combos] << parseComboObject(line, parsedData[:combos].count)
              when 5 # for Shang Tsung
                  return if !checkBeginning(line)
                  if parsedData[:morphs].nil?
                     parsedData[:morphs] = []
                  end
                  parsedData[:morphs] << parseMorphs(line, parsedData[:morphs].count)
          end
      end
      
      def getStripedScanObj(obj)
          return "" if obj.nil?
          return "" if obj[0].nil?
          return "" if obj[0][0].nil?
          return obj[0][0].strip
      end
      
      
      def parseSpecialMoves(line, count)
          nameRegex = /\s+([^:]+):/
          obj = parseMoveObject(line, count)
          obj[:name] = getStripedScanObj(line.scan(nameRegex))
          obj
      end
      
      
      def parseComboObject(line, count)
          obj = parseMoveObject(line, count)
          obj[:name] = "Combo " + (count+1).to_s
          obj
      end
      
       # for Shang Tsung
       def parseMorphs(line, count)
          nameRegex = /\s+([^:]+):/
          obj = parseMoveObject(line, count)
          obj[:name] = getStripedScanObj(line.scan(nameRegex))
          obj
      end
      
      def parseMoveObject(line, count)
          noteRegex = /\(([^\)]+)\)/
          nameRegex = /\s+([^:]+):/
          obj = { name: "", note: "", keys: {} }
          keysVar = line.gsub(noteRegex,"").gsub(nameRegex,"").strip.delete(' ')
          clearReg = /\s?-\s?.*/
          # Nintendo 64 exception
          if (keysVar.match(/;/))
             keysVar.split(";").each {
                |spl|
                otherMatch = false 
                if(spl.match(/PC/)) 
                    obj[:keys][:pc] = spl.gsub(clearReg,"").strip
                    otherMatch = true
                end
                if(spl.match(/PSX/)) 
                    obj[:keys][:psx] = spl.gsub(clearReg,"").strip
                    otherMatch = true
                end
                if(spl.match(/N64/))
                    obj[:keys][:n64] = spl.gsub(clearReg,"").strip
                    otherMatch = true
                end
                if(spl.match(/SS/))
                    obj[:keys][:ss] = spl.gsub(clearReg,"").strip
                    otherMatch = true
                end
                if !otherMatch 
                    obj[:keys][:all] = spl.gsub(clearReg,"").strip
                end 
             }
          # regular keys
          else 
             obj[:keys][:all] = keysVar.gsub(clearReg,"").strip
          end  
          obj[:note] = getStripedScanObj(line.scan(noteRegex)) 
          obj
      end
      
      
      def checkBeginning(line)
        line.match(/^\s+/)
      end
    
end


o = ParseMKTrilogy.new
o.processAllCharacters()
puts "----------- DONE --------- "