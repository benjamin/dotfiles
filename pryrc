#!/usr/bin/ruby
Pry.config.editor = "mate -w"

# My pry is polite
Pry.hooks = { :after_session => proc { puts "bye-bye" } }

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

%w{hirb}.each { |gem| require gem }

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env
