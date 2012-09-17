require 'rubygems'
require 'json'
require 'httparty'

if RUBY_VERSION > "1.9"
  require 'csv'
else
  require 'fastercsv'
end

puts "Hello world"

sunlight_list_url = "http://so.danwin.com.s3.amazonaws.com/onacode/sunlight-foundation-congress-10.txt"

puts "Testing HTTParty...fetching #{sunlight_list_url}"
puts "(you need to be online for this)"

response = HTTParty.get(sunlight_list_url)


puts "\n#{response.length} bytes downloaded from #{sunlight_list_url}."

puts "\n\nTesting the (Faster)CSV library"

if RUBY_VERSION > "1.9"
  csv = CSV.parse(response, :col_sep=>"\t", :headers=>true)
else
  csv = FasterCSV.parse(response, :col_sep=>"\t", :headers=>true)
end

str = csv[2]['firstname'] + " " + csv[2]['lastname']
puts "The name in the second row is: " + str


puts "\n * Script is done. Success"
