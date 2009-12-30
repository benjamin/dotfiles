#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), 'core', 'basher_system')

class BashBot
  def self.handle_command(command)
    bot = self.new
    bot.get_bashing(command)
  end

  def load_bashers
    Bashers.bash_bot = self
    Dir["#{File.dirname(__FILE__)}/bashers/*.rb"].each{ |x| load x }
  end
   
  def get_bashing(command)
    Bashers.handle_command(command)
  end

  def run(*cmd)
    cmd.compact!
    $stderr.puts "BashBot is handling things: '#{cmd.join(' ')}'"
    system(*cmd)
  end

  def echo(message)
    $stderr.puts("\n" + message)
  end
  
private
  def initialize
    load_bashers
  end
end
 
#Main
command = ARGV
if BashBot.handle_command(command)
  exit(255)
else
  exit(0)
end
