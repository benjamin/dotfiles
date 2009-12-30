Bashers.define "gem" do
  author "Benjamin Birnbaum"
  desc "Gem Handlers"

  handler(/^remove ([A-Za-z0-9_\-\/]+)\.gem$/) do |gem_name|
    bash.run("gem", "uninstall", gem_name)
  end
  
  handler(/^([A-Za-z0-9_\-\/]+)\.gem$/) do |gem_name|
    bash.run("gem", "install", gem_name)
  end
  
  handler(/^gems\s?([A-Za-z0-9_\-\/]+)?/) do |gem_name|
    bash.run("gem", "list", gem_name)
  end
end