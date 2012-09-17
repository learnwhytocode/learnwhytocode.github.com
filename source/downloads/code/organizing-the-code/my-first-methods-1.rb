require 'rubygems'
require 'cgi'
require 'httparty'

def download_from_url(the_url)
	resp = HTTParty.get(the_url)
	# note: when resp is converted to a string, it contains only the 
	# content from the_url, not the methods and attributes from HTTParty
	return resp 
end

def url_to_local_filename(url)
	CGI.escape(url)
end

def local_filename_to_url(fname)
	CGI.unescape(fname)
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
