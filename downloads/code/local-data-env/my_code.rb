require 'rubygems'
require 'json'
require 'httparty'

if RUBY_VERSION > "1.9"
  require 'csv'
else
  require 'fastercsv'
end


###############
# Constants
TWITTER_DATA_HOST = File.expand_path("data-hold")
TWITTER_USER_DATA_PATH = File.join(TWITTER_DATA_HOST, "users")
TWITTER_TWEETS_DATA_PATH = File.join(TWITTER_DATA_HOST, "statuses")

CSV_DATA_MAIN_FILENAME = File.join TWITTER_DATA_HOST, 'sunlight-foundation-congress-master.csv'




################ Data paths

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

##################### Retrieval methods

def get_data_file(fname)
  # note: modified for local data access
  
  # pre: fname is a filename string (not a URL anymore)
  # returns: opens the file at the given fname and returns the data read.
  #  it also closes the file after reading it
    
  if File.exists?(fname)  
    fstream = File.open(fname, 'r')
    fbody = fstream.read
    fstream.close  # just something we have to do
    return fbody
    
  else
    return false
  end  
end



def get_twitter_user(screen_name)
  # pre: screen_name is a Twitter account name, as a string
  # returns: user info as a Hash object
  #   returns nil if get_data_file is nil or false
  
  d = get_data_file( url_for_twitter_user_info(screen_name))
  if d  
    
    # some user data files are faulty
    hsh = JSON.parse(d)
    if hsh['error']
      return nil
    else
      return false
    end
    
  else
    return nil
  end    
  
end

def get_tweets_page(screen_name, pg_num)
  # pre: screen_name is a Twitter account name, as a string; pg_num
  #      the page number, as tweets are separated into numbered pages
  
  # returns: an array of tweet Hash objects
  #   returns nil if get_data_file is nil or false
  
  
  d = get_data_file( url_for_tweets_page(screen_name, pg_num))
  if d
    return JSON.parse(d)    
  else
    return nil
  end    
end


def get_user_tweets(screen_name)
  
  # pre: screen_name is a Twitter account name, as a string;
  
  # returns: an array `tweets_arr` of tweet Hash objects for 
  # the given screen_name
  
  
  tweets_arr = []
  (1..32).each do |pg_num|
    pagefname = url_for_tweets_page(screen_name, pg_num)
    
    tweets = get_tweets_page(screen_name, pg_num)
    if !(tweets.nil?)      
      tweets_arr += tweets
      # puts "\tAdded " + tweets_arr.length.to_s
    else
      break # quit when no file is found
    end
  end
  
  return tweets_arr  
end



def get_congress_data_from_file(fname)
  # pre: fname is a CSV file where congressmember data is located
  # returns: an array of Hash objects
  
  data = get_data_file(fname)
  
  
  if RUBY_VERSION > "1.9"
    return CSV.new(data, {:headers=>true})
  else
    return FasterCSV.new(data, {:headers=>true})
  end
end


puts "Done loading my code!"
