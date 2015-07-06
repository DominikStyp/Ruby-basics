#!/usr/bin/ruby -w

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

require 'rexml/document'
require 'rexml/streamlistener'
include REXML


# This example does exactly the same job as parseDOM.rb file
# But it has more complicated mechanism of reading from the stream instead of loading full document into memory at once
# This is very useful in working with big XML files, and you haven't much RAM memory to store whole document into it

class Listener
  include REXML::StreamListener
  
  def tag_start(*args)
      @tagName = args[0]
      if @tagName == "programmer"
        puts "Programmer: " + args[1]["name"] + " " + args[1]["surname"]
        puts "    Languages:"
      else 
        nil
      end
  end

  def text(data)
    return if data =~ /^\s*$/ # return nil if data match only spaces
    if @tagName == "lang"
      puts "        -" + data
    end
  end
end

list = Listener.new
xmlfile = File.new("sample.xml")
Document.parse_stream(xmlfile, list)