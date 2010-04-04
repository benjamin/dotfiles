Bashers.define "GoogleConverter" do
  author "Benjamin Birnbaum"
  desc "Unit/Currency conversion powered by google"

  handler /^(.+) in (.+)$/ do |from, to|
    require 'rubygems'
    require 'cgi'
    require 'scrubyt'

    google_converter = Scrubyt::Extractor.define do
      fetch "http://www.google.com.au/search?q=#{CGI::escape(from)}+in+#{CGI::escape(to)}"
      google_result "//td/h2/b" do
        final_result(/(.+ = .+)/)
      end
    end

    conversion = google_converter.to_hash
    if conversion.empty?
      puts "Um, whatcha talkin bout?"
    else
      puts conversion[0][:final_result]
    end
  end
end