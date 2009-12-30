Bashers.define "BashBot" do
  author "Benjamin Birnbaum"
  desc "Some Bash Bot Handlers"

  handler "bashbot" do
    puts "Yeh, whatcha looking at??"
  end

  handler "bashbot about" do
    puts "I am the BashBot - I'm here to serve you!"
    puts "I have #{Bashers.registered.size} bashers that provide you with #{Bashers.handlers.size} handlers"
  end  
end