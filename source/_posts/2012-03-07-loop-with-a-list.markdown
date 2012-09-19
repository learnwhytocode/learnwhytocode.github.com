---
layout: post
title: "Loop with a list"
date: 2012-09-12 03:07
comments: true
categories: 
problem: "We want to get tweets from more than one Congressmember"
solution: "Use another loop to read from a list of Congressmembers."
---

As fun as it's been to collect tweets from Rep. Nancy Pelosi, you probably have bigger ideas, or at least want to compare Pelosi to her peers. 

Good for you; the big picture should always be considered. The problem is, the big picture takes more work.

And this is where programming begins to pay off.

## Reading a simple list

You could probably look up the Twitter handles of the other Congressmembers yourself and then copy and paste them into whatever tweet-collecting program you've devised.

But that's not scalable. And totally unnecessary if such a list already exists.

Here's a [sample list of ten congressmembers](http://nottwitter.danwin.com/simple-congress-list.txt). It's just a straightforward textfile with one Twitter name per line:

{% include_code data/simple-congress-list.txt %}

Wouldn't it be nice if we could break this into an array?

### Split

We know that if we `HTTParty.get` that list, we'll have a `String` of text. But we don't want *one* string, we want as many strings as there are lines.

So let's use the  `split` method of `String`. It takes in **one argument**: the string that you want to divide the invoking string by. It **returns:** an array of elements from that divided string:

``` ruby
str = "hello world, I am 42 years old"
arr = str.split
# => ["hello", "world,", "I", "am", "42", "years", "old"] 
puts arr.length
# => 7
```

### The backslash and newline character
To get an array of Congressmember Twitter names, we need to split the sample text file by whatever character is used to create a **newline**, i.e. the thing that happens when we press **Enter**.

This is the **newline** character: `"\n"`

In Ruby strings, newlines are just characters. That **backslash** &ndash; `\n` &ndash; before the `n` &ndash; has a special meaning in Ruby (and other programming languages). 

The backslash acts as an **escape character**, and it affects the character that immediately follows it. In this case, this is the letter `n`. 

In other words, `\n` is not just a normal, literal `n` character, but the symbol for a **newline**, i.e. a line break.


So, write the code to:

1. Download from the URL [at this link](http://nottwitter.danwin.com/simple-congress-list.txt)
2. Separate it into an array
3. Loop through the array, printing out an uppercase version of each string:

``` ruby
require 'rubygems'
require 'httparty'

url = "http://nottwitter.danwin.com/simple-congress-list.txt"
str = HTTParty.get(url).body
arr = str.split("\n")

arr.each do |name|
	puts name.upcase
end

# JOEBIDEN
# ROYBLUNT
# SENATORBOXER
# CHUCKGRASSLEY
# DARRELLISSA
# JOELIEBERMAN
# REPRONPAUL
# JAREDPOLIS
# SENRANDPAUL
# NANCYPELOSI
```



## Exercise


Obviously, we don't want just the names in uppercase, we want to *do* something. Why don't we combine the power of this loop with some of the functionality from last chapter's loops?

Once you've gathered the names in the list, loop through the list and print the `created_at` and `text`  of the *latest* tweet from each of the Twitter accounts.

(Twitter spits out the tweets in reverse chronological order. So for our purposes, this would be the *first* tweet in an array).







``` ruby
require 'rubygems'
require 'httparty'
require 'json'

list_url = "http://nottwitter.danwin.com/simple-congress-list.txt"
str = HTTParty.get(list_url).body
arr_of_names = str.split("\n")


tweets_json_url_pattern = "http://nottwitter.danwin.com/statuses/_SCREENNAME_/1/user_timeline.json"



arr_of_names.each do |name|

	tweets_json_url = tweets_json_url_pattern.sub("_SCREENNAME_", name)
	tweets_json = HTTParty.get(tweet_json_url).body
	tweets_arr = JSON.parse(tweets_json)
	
	# just need the first tweet
	tweet = tweets_arr[0]
	puts name + " tweeted on " + tweet['created_at'] + ": " + tweet['text]
	
end

```





