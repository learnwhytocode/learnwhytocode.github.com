require './my-file-io.rb'

ROOT_LOCAL_DATA_PATH = File.expand_path('data-hold')
ROOT_TWITTER_DATA_PATH = ROOT_LOCAL_DATA_PATH


def twitter_account_info_path(screen_name)
  File.join(ROOT_TWITTER_DATA_PATH, 'users', screen_name, 'show.json')
end


def twitter_account_tweets_path(screen_name, page_num)
  File.join(ROOT_TWITTER_DATA_PATH, 'statuses', screen_name, page_num.to_s, 'user_timeline.json')
end



def get_data_from_local_storage(addr)
  ## when the data is all local, we just open these files
  ## because we care about simplicity and not great coding, we just 
  ## rewrite this method
  
  if File.exists?(addr)    
    return my_file_reader(addr)
  else
    return false  
  end
  
end
