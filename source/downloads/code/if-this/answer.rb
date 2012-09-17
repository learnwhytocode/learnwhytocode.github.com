load './my-first-methods.rb'


def is_valid_http_response(resp)
	resp.code != 200
end


def fetch_all_tweets_for_user(screen_name)
  
  url_pattern = "http://TK_DATA_ROOT_PATH/statuses/" + screen_name  + "/_PAGENUM_/user_timeline.json"

  (1..20).each do |page_num|
    
    url = url_pattern.sub('_PAGENUM_', page_num.to_s)
   
    puts "Loop no. " + page_num.to_s
    puts "Fetching from: " + url
    
    resp = download_from_url(url)
    
    if is_valid_http_response(resp) == false 
      puts "Invalid file at this url...breaking"
      break
    end
        
    puts "Success...saving response"
    
  	filename = url_to_local_filename(url)
  	my_file_writer(filename, resp)
    
    puts "sleeping for 0.2 seconds"
    sleep 0.2 # generally a good idea not to hammer file server
    
  end  
end



