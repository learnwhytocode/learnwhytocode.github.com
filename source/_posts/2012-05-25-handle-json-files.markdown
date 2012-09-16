---
layout: post
title: "Handle JSON files"
date: 2012-09-12 05:25
comments: true
categories: 
problem: "How do we deal with JSON data files?"
solution: "Use Arrays and Hashes to process JSON as easily as a spreadsheet"
---
 

##### Exercises

Write a method named `get_all_tweets_for` that:

1) Takes one argument, a Twitter account name
2) Reads every JSON tweets file for that account name
3) Parses the JSON and returns a single array containing all the tweets for the given user


Sample usage:

``` lang:ruby
tweets = get_all_tweets_for('TKNAME')
puts "The user " + `TKNAME` + " has this many tweets: " + tweets.length.to_s
```

Note: You'll have to build off the other methods we've used to access local tweet files.



##### Answers

```
# TK save to file


do we need this from previous chapter:

def get_tweets_local_filenames_for(screen_name)
	Dir.glob("data-hold/TK") # should we do CONSTANT for path here?
	return arr
end


def get_all_tweets_for(screen_name)
	arr_of_fnames = get_tweets_local_filenames_for(screen_name)
	
	arr_of_tweets = []
	
	arr_of_fnames.each do |fname|
		jsonstr = my_file_reader(fname)
		JSON.parse(jsonstr)
		# TK
		arr_of_tweets << TK
	end
	
	return arr_of_tweets

end
```