Bashers.define "Git" do
  author "Benjamin Birnbaum"
  desc "Handle Git urls and other git stuff"

  handler /^([^:\/]+:\/\/.*\.git)\w*(.*)$/ do |git_url, clone_location|
    clone_location = clone_location.empty? ? nil : clone_location.strip
    bash.run("git", "clone", git_url, clone_location)
  end
end