require 'rubygems'
require 'json'
require 'fastercsv'
require 'httparty'

puts "Hello world"

url = "http://learnwhytocode.danwin.com"
puts "Testing HTTParty...fetching #{url}"
puts "(you need to be online for this)"

response = HTTParty.get(url)
puts "\n#{response.length} bytes downloaded from #{url}."

puts "\n * Script is done."
