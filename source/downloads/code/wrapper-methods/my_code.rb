require 'rubygems'
require 'json'
require 'httparty'


###############
# Constants
TWITTER_DATA_HOST = "http://nottwitter.danwin.com"
TWITTER_USER_DATA_PATH = File.join(TWITTER_DATA_HOST, "users")
TWITTER_TWEETS_DATA_PATH = File.join(TWITTER_DATA_HOST, "statuses")

def url_for_twitter_user_info(screen_name)
  # pre: screen_name a Twitter account name as a string
  # returns: url (string) to get user data
  
  File.join(TWITTER_USER_DATA_PATH, screen_name, 'show.json')
end

def url_for_tweets_page(screen_name, pg_num)
  # pre: screen_name is a Twitter account name, as a string; pg_num
  #      the page number, as tweets are separated into numbered pages


  # returns: url (string) to get tweets
  
  File.join(TWITTER_TWEETS_DATA_PATH, screen_name, pg_num.to_s, "user_timeline.json")
end

def get_data_file(u)
  # pre: u is a URL string
  # post: downloads from u; has no protection against bad URLs
  # i.e. this will have to be modified later
  
  HTTParty.get(u)

end

def get_twitter_user(screen_name)
  # pre: screen_name is a Twitter account name, as a string
  # returns: user info as a Hash object
  
  d = get_data_file( url_for_twitter_user_info(screen_name))
  JSON.parse(d)
end

def get_tweets_page(screen_name, pg_num)
  # pre: screen_name is a Twitter account name, as a string; pg_num
  #      the page number, as tweets are separated into numbered pages
  
  # returns: an array of tweet Hash objects
  
  d = get_data_file( url_for_tweets_page(screen_name, pg_num))
  JSON.parse(d)
end



puts "Done loading my code!"
