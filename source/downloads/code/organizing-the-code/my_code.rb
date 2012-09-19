require 'rubygems'
require 'json'
require 'httparty'


###############
# Constants
TWITTER_DATA_HOST = "http://nottwitter.danwin.com"
TWITTER_USER_DATA_PATH = File.join(TWITTER_DATA_HOST, "users")
TWITTER_TWEETS_DATA_PATH = File.join(TWITTER_DATA_HOST, "statuses")


puts "Done loading my code!"
