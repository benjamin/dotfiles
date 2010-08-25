Bashers.define "Git" do
  author "Benjamin Birnbaum"
  desc "Handle Git urls and other git stuff"

  handler /^([^:\/]+:\/\/.*\.git)\w*(.*)$/ do |git_url, clone_location|
    clone_location = clone_location.empty? ? nil : clone_location.strip
    bash.run("git", "clone", git_url, clone_location)
  end

  handler /^git-ignore (.*)$/ do |file|
    bash.run("git", "update-index", "--assume-unchanged", file)
  end

  handler /^git-unignore (.*)$/ do |file|
    bash.run("git", "update-index", "--no-assume-unchanged", file)
  end

  handler /^git-list-ignored$/ do
    bash.run("git ls-files -v | grep ^[a-z]")
  end
end