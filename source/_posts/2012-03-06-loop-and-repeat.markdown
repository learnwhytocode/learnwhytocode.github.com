---
layout: post
title: "Loop and repeat"
date: 2012-09-20 03:06
comments: true
categories: 
problem: "How to read from hundreds of tweets without writing hundreds of commands."
solution: "Use a loop to repeat commands as many times as we need."
status: checked
---

We've run through a fair number of concepts and code but really haven't done anything we couldn't do (and do faster) with a web browser, such as look up a Twitter user's number of followers, or how many people retweeted his/her most recent tweet.

If you're a pretty fast copy-and-paster, you might be able to outpace a mouse-clicker by copying-and-pasting the tweet-data-fetching routines over and over, which is not a bad accomplishment. 

But we can do *much* better than that.

## Make a simple goal

In programming, you'll get more return out of every line of code when you break things down into simple tasks.

In the last chapter, what was one of our goals? *To print out the text of a tweet*.

## Repeat that step across a collection

The code for printing out one tweet's text is the same as it is for any other given tweet. The only difference is the *reference* to each tweet, i.e. its address in an array. 

## each

Ruby collections have many useful methods, but the one we'll use the most is `each`. In a nutshell, `each` lets us loop through a collection and perform a method on each member of that collection.

On a simple array:

``` ruby

['a', 'b', 'c'].each do |some_item|
	puts some_item.upcase
end

#=>
A
B
C
```

Without getting into the nitty-gritty, think of what is between the `do` and the `end` as the routine done on each `some_item`.

What is `some_item`? In this syntax, the value in the straight pipe-characters is the variable name used to reference a member of the collection.

If you think of `each` as looping through the collection and doing something on *each* member of the collection, then `some_item` (which we could name anything we want, as if it were a variable) points to the member of the current iteration.

There are other variations of the `each` method. For a `Hash` object, you could use `each_pair`:

``` ruby
my_hash = {'a'=>'alpha', 'b'=>'beta', 'c'=>'charlie'}

my_hash.each_pair do |k,v|
	puts k.to_s + " is the key for: " + v.to_s
end  

#=>
a is the key for: alpha
b is the key for: beta
c is the key for: charlie
```

## Exercise

1. Using the `each` method, loop through the array of tweets from the last lesson and print out the contents of the text.

2. Using the `each` method again, loop through the tweets and print the *length* of their text.

3. Same procedure above, but use it to calculate the *average* length of a tweet.

4. Using the `each` method again, loop through and print out every attribute of each tweet.

### Answer

To get the tweets in an array:

``` ruby
require 'rubygems'
require 'json'
require 'httparty'

screenname = "ChuckGrassley"


url = File.join( "http://nottwitter.danwin.com", 
	"statuses",
	screenname,
	1.to_s,
	"user_timeline.json" )	

json_str = HTTParty.get(url).body
tweets_obj = JSON.parse(json_str)
``` 

1. Printing out text:

``` ruby
tweets_obj.each do |tweet|
	puts tweet['text']
end
```

**Note:** if you are using **irb**, the result of each `each` invocation will spit out the entire contents of the collection. This is **irb**'s normal behavior, to return the value of each method call after you hit **Enter**. It's slightly annoying and means you'll have to scroll up a bit to find the output you want. Or you could append a trivial line of code after the keyword `end`, *on the same line with a semi-colon as separation*. Like so:


``` ruby
tweets_obj.each do |tweet|
	puts tweet['text']
end; puts "done with each"
``` 

2. Printing out the length of each tweet

``` ruby
tweets_obj.each do |tweet|
	puts tweet['text'].length
end
```

3. Printing out the average length the tweets


``` ruby
total_length = 0
tweets_obj.each do |tweet|
	total_length = total_length + tweet['text'].length
end

puts total_length / tweets_obj.length
```

4. Printing out the attributes of each tweet

``` ruby
tweets_obj.each do |tweet|
	tweet.each_pair do |key, val|
		puts key.to_s + " --> " + val.to_s
	end
end
```









