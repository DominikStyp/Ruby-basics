=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
  This class requires Nokogiri gem - which is used as HTML parser of the page
  Purpose of this class is to download HTML page to unique file named by md5(url),
  and return Nokogiri object of the page.
  If page is already downloaded, script uses cached version.
  
  Usage:
  
  obj = GetNokogiriHTMLCachedDoc.new("http://some-page.com/x.html", "cacheFolder")
  obj.getPage
=end

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'digest'

class GetNokogiriHTMLCachedDoc

      def initialize(url, cacheFolder = "downloaded")
         @cacheFolder = cacheFolder
         @url = url
         if @url.nil?
            raise "@url variable is empty!"
         end
         # set cache path
         @cachePath = File.dirname(__FILE__) + "/" + @cacheFolder.to_s + "/" + md5(@url)
         getPage()
      end
      
      def getPage
              if(!cacheFileExists())
                  @doc = Nokogiri::HTML(open(@url))
                  saveDocToCache()
                  #puts "Got from the URL"
              else 
                  f = File.open(getPath())
                  #puts "Got from the cache"
                  @doc = Nokogiri::HTML(f)
              end
              @doc
      end
      
      private 
      
          def md5(str)
              Digest::MD5.hexdigest(str).to_s
          end
          
          def getPath
              @cachePath
          end
          
          def cacheFileExists
              File.exist?(getPath()) && File.stat(getPath()).size > 100
          end
          
          def saveDocToCache
              source = open(@url).read
              file = File.open(getPath(), "a")
              file.syswrite(source.to_s)
          end
end

