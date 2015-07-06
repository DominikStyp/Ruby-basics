#!/usr/bin/ruby -w

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

def showTimeParts
    time = Time.new
    # Components of a Time
    puts "Current Time : " + time.inspect
    puts time.year    # => 2015
    puts time.month   # => 1 - 12 without leading zeros
    puts time.month.to_s.rjust(2, "0") # month with leading zeros 01 - 12
    puts time.day     # => 1 - 31 without leading zeros
    puts time.wday    # => 0-Sunday, 1-Monday....6-Saturday
    puts time.yday    # => 1-365
    puts time.hour    # => 0-23
    puts time.min     # => 0-59
    puts time.sec     # => 0-59
    puts time.usec    # => 0-999999: microseconds
    puts time.zone    # => "UTC": timezone name
end 


def differenceBetweenDates
   require 'date'
   a = Date.parse("10/12/2000")
   b = Date.parse("10/12/2010")
   daysDiff = b.mjd - a.mjd
   puts "Days between the dates: " + daysDiff.to_s
   puts "Simple difference: " + (b - a).to_s # you can add .to_i to get rid of "/1"
end
differenceBetweenDates

def createDate
  d = Date.new(2014, 1, 1)
end

def timezones
  time = Time.new
  # Here is the interpretation
  time.zone       # => "UTC": return the timezone
  time.utc_offset # => 0: UTC is 0 seconds offset from UTC
  time.zone       # => "PST" (or whatever your timezone is)
  time.isdst      # => false: If UTC does not have DST.
  time.utc?       # => true: if t is in UTC time zone
  time.localtime  # Convert to local timezone.
  time.gmtime     # Convert back to UTC.
  time.getlocal   # Return a new Time object in local zone
  time.getutc     # Return a new Time object in UTC
end





