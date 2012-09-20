---
layout: post
title: "Writing more wrappers"
date: 2012-09-20 03:15
comments: true
categories: 
problem: "We're having trouble understanding the code we're reusing."
solution: "Wrap these routines in easy-to-read method calls."
---

Let's build off of the **my_code.rb** file we made in the last chapter:

{% include_code Our common code organizing-the-code/my_code.rb %}


It's been kind of annoying to re-formulate the URL for getting tweets and user info. So let's use those constants to write methods to conveniently generate the needed URLs.

(this is just practice with no new concepts)

## Exercise

#### Form the URL pattern for Twitter account info

Use the two constants we have in **my_code.rb** to build out a URL. You may want to use the `File.join` method

e.g. `http://nottwitter.danwin.com/users/NancyPelosi/show.json`

Call it: ``

#### Form the URL pattern for a page of a user's tweets 

Same as above, except for a page of tweets

e.g. `http://nottwitter.danwin.com/statuses/NancyPelosi/1/user_timeline.json`

Call it: ``

#### Downloading from a URL

This method downloads from a URL (yes, this may very well be a one-liner)

#### Getting a Twitter user account data as a Hash

Given an account name, this returns account data as a Hash


#### Getting a Twitter user's page of tweets as an Array 

Given an account name and page number, this returns tweet hashes as an Array.



### Answer

Your **my_code.rb** should look like this:

{% include_code Our common code redone wrapper-methods/my_code.rb %}


## The beauty of abstraction

What was the point of all that work? Was it needed?

We're doing more and more complicated tasks. The details remain the same but the pure repetition of text makes it all seem like a jumble. Sometimes it's worth it to stop trying new things and wrapping up what we've done in a nice package.

### Revisit and refactor

Remember this exercise from a few chapters back?

{% include_code Printing the latest tweet lang:ruby latest-tweets.rb %}

Write it out, but this time with our new methods:

``` ruby
load './my_code.rb'

list_url = File.join(TWITTER_DATA_HOST, "simple-congress-list.txt")
str = get_data_file(list_url)
arr_of_names = str.split("\n")

arr_of_names.each do |name|
	tweets_arr = get_tweets_page(name, 1) 	
	
	# just need the first tweet
	tweet = tweets_arr[0]
	puts name + " tweeted on " + tweet['created_at'] + ": " + tweet['text]	
end

```


