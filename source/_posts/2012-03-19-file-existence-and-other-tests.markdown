---
layout: post
title: "File existence and other considerations"
date: 2012-09-20 03:18
comments: true
categories: 
problem: "How do we loop through all the tweet pages on the local drive?"
solution: "Change our get_data_file method to check for file existence."
---


When we were retrieving data online, I carefully avoided the task of fetching more than one page of tweets per user.

This is because, for the sake of brevity, I didn't want to explain the many different ways a web server could respond to a request for an invalid file.

But now that the files are all on our hard drive, this is an easier problem to deal in the abstract. 

This chapter will be a refresher on the `if` statement


## File.exists?

The `File` class (again, part of Ruby's core) has a handy `exists?` method, which returns `true` or `false` if a file actually exists at a given filename:

```ruby
File.exists?("somenameimadeup.txt")
#=> false
```	

**Note:** You may be wondering, *how does a method name have a question mark? I thought only alphanumeric characters could be used?* Yes, generally...this is a Ruby-specific convention. You have the option of using the `?` to indicate to users that this method returns `true` or `false`, though it's just a convention...you could be a jerk and return whatever you want. Also, the `!` is allowed in method names. I won't explain that right now.


## How to loop through numbers?

The pattern for tweet pages is:

``` ruby
url_for_tweets_page('NancyPelosi', 1)
"data-hold/statuses/NancyPelosi/1/user_timeline.json"

url_for_tweets_page('NancyPelosi', 2)
"data-hold/statuses/NancyPelosi/2/user_timeline.json"

url_for_tweets_page('NancyPelosi', 3)
"data-hold/statuses/NancyPelosi/2/user_timeline.json"
```

So we just need to change the argument corresponding to the page number. So how to do a loop from `1` to `5`? You could think of it as looping through an `Array` of numbers:

``` ruby
[1,2,3].each do |i|
	url_for_tweets_page('NancyPelosi', i)
end
```	

Ugh, but who wants to enter each number into the array? Luckily, Ruby has another collection object called `Range`. Here's one way it can be used:

``` ruby
(1..5).each do |pg_num| 
	url_for_tweets_page('NancyPelosi', pg_num)
end

```


## The else

So it's easy to set a `Range` from `1` to whatever number we need. But what if there are fewer tweet pages than the endpoint of our range?

Sounds like a use case for `File.exists?`

``` ruby
(1..100).each do |pg_num| 
	fname = url_for_tweets_page('NancyPelosi', pg_num)
	
	if !(File.exists?(fname))
		puts "The page " + pg_num.to_s " does not exist"
	end	
end
```

FYI, that exclamation mark `!` serves to **negate** the expression. So in the above case, if `File.exists?` returns `false` &ndash; because the file doesn't exist &ndash; the `!` makes it `true`, causing the `if` branch to execute.

That's admittedly confusing. So instead, we can use the `else` statement which allows us to define what happens when the `if` condition fails:

``` ruby
(1..100).each do |pg_num| 
	fname = url_for_tweets_page('NancyPelosi', pg_num)
	 
	if File.exists?(fname))
		puts "The page " + pg_num.to_s " exists"
	else
		puts "The page " + pg_num.to_s " does not exist"
	end	
end
```


## Break a loop

It seems wasteful to continue a loop if we know the condition is going to be false after the first non-existent file is found.

The `break` keyword allows us to break out of the current loop:

``` ruby
(1..100).each do |pg_num| 
	fname = url_for_tweets_page('NancyPelosi', pg_num)
	 
	if File.exists?(fname))
		puts "The page " + pg_num.to_s " exists"
	else
		puts "The page " + pg_num.to_s " does not exist"
		break
	end	
end
```


## A more careful data-getting method

We could test for file existence in a lot of places in a program. One place where it seems logical is in our `get_data_file` method, which currently will crash the program if an invalid file name is passed in.

Try to modify it so that it returns `false` if the given filename does not exist:


```
def get_data_file(fname)
	if File.exists?(fname)
		fstream = File.open(fname, 'r')
		fbody = fstream.read
		fstream.close  # just something we have to do
		return fbody
	else
		return false
	end
end
``` 

This is actually problematic because `get_twitter_user` and `get_tweets_page` depends on `get_data_file`. And they need to be modified to deal with a returned `false` value.

Sound like a dilemma? Welcome to the joy of professional programming.

For now, I vote to *not* modify `get_data_file` to have this logic. This will affect the answer to the exercise below.


## Exercise

We now know enough to collect all the tweet pages (on our hard drive) for a given user. Use the existing `get_tweets_page` method, write a new method called `get_all_user_tweets`.

1. It should only take in one argument
2. It should not loop wastefully once the last page has been reached
3. It should return an array containing all the tweets collected across the pages.

FYI, this is how you add two arrays together:

``` ruby
arr_a = [1,2,3,4]
arr_b = [1,2,3,4]

arr_a + arr_b
#=> [1, 2, 3, 4, 1, 2, 3, 4]

```








