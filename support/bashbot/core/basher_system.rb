require File.join(File.dirname(__FILE__), 'basher_base')
 
module BashBotErrors
  class HandlerNotFound < StandardError; end
  class TooManyHandlers < StandardError; end
end
 
class Bashers
  @registered = []
  @handlers = []
  class << self
    attr_reader :registered
    attr_reader :handlers
    attr_accessor :bash_bot
    private :new
  end
 
  def self.define(name, &block)
    basher = BasherBase.new(@bash_bot)
    basher.instance_eval(&block)
    @registered << name
    @handlers += basher.handlers
  end
  
  def self.handle_command(args)
    command_str = args.join(" ")
    handler = find_handler(command_str)
    handler.invoke(command_str)
  end
  
  def self.find_handler(command_str)
    matches = @handlers.find_all { |h| h.match(command_str) }
    raise BashBotErrors::HandlerNotFound if matches.empty?
    raise BashBotErrors::TooManyMatches if matches.size > 1 #The plan is to get smarter about multiple matches.
    matches.first
  end
end