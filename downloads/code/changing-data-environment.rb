## ignore this for now, just monkey patch get_data_from_url

def is_local_address?(addr)
  addr.match("http://").nil?
end

def get_local_fname_from_url(url)
  
  if is_local_address?(url)
    fname = url
  else
    
    _local_data_dir = "my-data-store"
    fname = File.join(_local_data_dir, CGI.escape(url))
  end
  
  return fname
end

def data_file_exists?
  if is_local_address?()
end


