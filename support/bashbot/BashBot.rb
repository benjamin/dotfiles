#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), 'core', 'basher_system')

class BashBot
  def self.handle_command(command)
    self.new(command)
  end

  def run(*cmd)
    cmd.compact!
    system(*cmd)
  end

private
  def initialize(command=nil)
    load_bashers
    Bashers.handle_command(command) if command
  end
  
  def load_bashers
    Bashers.bash_bot = self
    Dir["#{File.dirname(__FILE__)}/bashers/*.rb"].each{ |x| require x }
  end   
end
 
#Main
begin
  BashBot.handle_command(ARGV)
  exit(255)
rescue BashBotErrors::HandlerNotFound
  exit(0)
end