require File.join(File.dirname(__FILE__), 'basher_sugar')
 
class BasherBase
  extend BasherSugar
  def_field :author, :desc
  attr_reader :handlers
  
  def initialize(bashBot)
    @bashBot = bashBot
    @handlers = []
  end

  def bash
    @bashBot
  end

private
  def handler(pattern, &block)
    @handlers << BasherHandler.new(pattern, &block)
  end
end

class BasherHandler
  def initialize(pattern, &block)
    raise "Handlers must always have a block" if block.nil?
    if pattern.is_a?(String)
      regexp = pattern.gsub(/\$\w+/, '(.*)') # Replace $var with (.*)
      pattern = Regexp.new("^#{regexp}$") 
    end
    @regexp, @block = pattern, block
  end

  def match(name)
    case name
    when String then regexp.match(name)
    when Regexp then regexp == name
    end
  end

  def invoke(command_str)
    args = regexp.match(command_str).captures
    @block.call(*args)
  end
  
  def regexp
    @regexp
  end
end