#!/usr/bin/ruby -w

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

require 'rexml/document'
include REXML

xmlfile = File.new("sample.xml")
xmldoc = Document.new(xmlfile)

xmldoc.elements.each("employees/programmers/programmer"){
    |programmer| puts "Programmer: " + programmer.attributes["name"].to_s + " " + programmer.attributes["surname"].to_s
    puts "  languages: "
    programmer.elements.each("languages/lang") {
      |lang| puts "    -" + lang.text.to_s + ","
    }
}
