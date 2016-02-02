require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  require File.dirname(__FILE__) + '/private_config_vars.rb'
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README README.rdoc LICENSE private_config_vars.rb bin].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end

  Dir['bin/*'].each do |file|
    link_file(file, "/usr/local/bin", false)
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file, destination_dir=ENV['HOME'], dotfile=true)
  destination_file_name = dotfile ? ".#{File.basename(file, ".erb")}" : File.basename(file, ".erb")
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(destination_dir, destination_file_name), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking #{File.join(destination_dir, destination_file_name)}"
    system %Q{ln -s "$PWD/#{file}" "#{File.join(destination_dir, destination_file_name)}"}
  end
end
