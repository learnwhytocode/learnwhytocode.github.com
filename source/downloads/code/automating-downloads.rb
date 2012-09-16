# note: the HTTParty and CGI libraries must be installed and loaded
# FINAL VERSION

def get_local_fname_from_url(url)
  
  _local_data_dir = "my-data-store"
  fname = File.join(_local_data_dir, CGI.escape(url))
  
  return fname  # optional, as Ruby returns last line automatically
end


def get_data_from_url(url)
  
  local_fname = get_local_fname_from_url(url)
  
  # check to see if file exists
  if File.exists?(local_filename)
     # we've already downloaded the file, so just re-open it
     fstream = File.open(local_filename, 'r')
     data = fstream.read
     fstream.close    
   else
     # use HTTParty.get to download, then save it
     


   end
   
  
  data = HTTParty.get(url)
  fstream = File.open(local_fname, 'w')
  fstream.write(data)
  fstream.close
  
  # let's just return the result of the download  
  return data
end


