require File.join(File.dirname(__FILE__), 'basher_base')
 
class Bashers
  @registered = {}
  @@handlers = []
  class << self
    attr_reader :registered
    attr_reader :handlers
    attr_accessor :bash_bot
    private :new
  end
 
  def self.define(name, &block)
    basher = BasherBase.new(@bash_bot)
    basher.instance_eval(&block)
    # @handlers[name] = []
    @@handlers += basher.handlers
  end
  
  def self.handle_command(command)
    command_str = command.join(" ")
    handler = find_handler(command_str)
    handler ? handler.invoke(command_str) : nil
  end
  
  def self.find_handler(command_str)
    matches = @@handlers.find_all { |h| h.handler_match(command_str) }
    # matches = best_matches(handler_name, matches) if matches.size > 1 && options[:guess]
    raise "TOO MANY" if matches.size > 1
    matches.first
  end

  # def best_matches(step_name, step_matches)
  #   max_arg_length = step_matches.map {|step_match| step_match.args.length }.max
  #   top_groups     = step_matches.select {|step_match| step_match.args.length == max_arg_length }
  # 
  #   if top_groups.length > 1
  #     shortest_capture_length = top_groups.map {|step_match| step_match.args.inject(0) {|sum, c| sum + c.length } }.min
  #     top_groups.select {|step_match| step_match.args.inject(0) {|sum, c| sum + c.length } == shortest_capture_length }
  #   else
  #     top_groups
  #   end
  # end
  
  def bash
    @bash_bot
  end
end