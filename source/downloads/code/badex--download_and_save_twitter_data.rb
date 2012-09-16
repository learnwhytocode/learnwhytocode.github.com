# note: the HTTParty and CGI libraries must be installed and loaded
# bad TK
def download_and_save_twitter_data(url)
  
  _local_data_dir = 'data-store'
  escaped_url = CGI.escape(url)
  
  local_filename = File.join(_local_data_dir, escaped_url)
  
  if File.exists?(local_filename)
    # don't download, just open
    fstream = File.open(local_filename, 'r')
    data = fstream.read
    fstream.close    
  else
    # use HTTParty.get
    
    
  end
  
  
end

