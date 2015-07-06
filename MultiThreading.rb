#!/usr/bin/ruby

=begin
  @author: DominikStyp
  @url: https://github.com/DominikStyp
=end

# Here is example of how to use threads and accessing global variable from the threads


require 'thread'
# Mutex is a class that provides synchronization between threads
# Everything that is between 'mutex.synchronize do ...... end' won't be accessed by two (or more) concurrent threads in the same time
# This means that if one thread is inside mutex block, others have to wait
$mutex = Mutex.new

$globVar = 0

def th1
   10.times do 
      $mutex.synchronize do
          $globVar = $globVar + 10
          puts "th1 #{Time.now}: globVar + 10 =" + $globVar.to_s
      end
      sleep(2)
   end
end

def th2
   10.times do
      $mutex.synchronize do
          $globVar = $globVar + 1
          puts "th2 #{Time.now}: globVar + 1 =" + $globVar.to_s
      end
      sleep(1)
   end
end

puts "Start time: #{Time.now}"
thread1=Thread.new{th1()}
thread2=Thread.new{th2()}
thread1.join
thread2.join
puts "End time: #{Time.now}"