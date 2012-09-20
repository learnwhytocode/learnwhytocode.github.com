require 'rubygems'
require 'httparty'
require 'json'

list_url = "http://nottwitter.danwin.com/simple-congress-list.txt"
str = HTTParty.get(list_url).body
arr_of_names = str.split("\n")


tweets_json_url_pattern = "http://nottwitter.danwin.com/statuses/_SCREENNAME_/1/user_timeline.json"

arr_of_names.each do |name|

	tweets_json_url = tweets_json_url_pattern.sub("_SCREENNAME_", name)
	tweets_json = HTTParty.get(tweet_json_url).body
	tweets_arr = JSON.parse(tweets_json)
	
	# just need the first tweet
	tweet = tweets_arr[0]
	puts name + " tweeted on " + tweet['created_at'] + ": " + tweet['text]	
end
