# not used

require 'rubygems'
require 'cgi'
require 'httparty'
load './my-first-constants.rb'

def download_from_url(the_url)
	resp = HTTParty.get(the_url)
	# note: when resp is converted to a string, it contains only the 
	# content from the_url, not the methods and attributes from HTTParty
	return resp
end

def url_to_local_filename(url)
	fn = CGI.escape(url)
	File.join(LOCAL_STORAGE_DIR, fn)
end

def local_filename_to_url(fname)
	fn = File.basename(fname)
	CGI.unescape(fn)
end

def my_file_writer(filename, content)
	fstream = File.open(filename, "w")
	fstream.write(content)
	fstream.close
end

def download_and_save(url)
	content = download_from_url(url)
	filename = url_to_local_filename(url)
	my_file_writer(filename, content)
	
	return content
end


