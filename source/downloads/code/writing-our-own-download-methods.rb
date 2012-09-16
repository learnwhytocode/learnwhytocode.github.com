# note: the HTTParty and CGI libraries must be installed and loaded
# FINAL VERSION

require 'rubygems'
require 'cgi'
require 'httparty'
require './my-file-io.rb'

## unlike other variables, CONSTANTS can be accessed outside the scope
## of a method:

ROOT_TWITTER_DATA_PATH = "http://TK_DATA_ROOT_PATH"


def twitter_account_info_path(screen_name)
  File.join(ROOT_TWITTER_DATA_PATH, 'users', screen_name, 'show.json')
end


def twitter_account_tweets_path(screen_name, page_num)
  File.join(ROOT_TWITTER_DATA_PATH, 'statuses', screen_name, page_num.to_s, 'user_timeline.json')
end





def get_local_fname_from_url(url)
  
  _local_data_dir = "my-data-store"
  fname = File.join(_local_data_dir, CGI.escape(url))
  
  return fname  # optional, as Ruby returns last line automatically
end

def get_and_save_data(url)
  
  data = HTTParty.get(url)
  local_fname = get_local_fname_from_url(url)
  
  my_file_writer(local_fname, data)

  # let's just return the result of the download  
  return data
end



