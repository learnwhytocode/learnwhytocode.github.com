---
layout: post
title: "Making the complex, routine"
date: 2012-09-12 03:08
comments: true
categories: 
problem: "All these simple steps are adding up to many lines of intimidating code."
solution: "Wrap up routines into a method call."
---

## Label our work

Things are getting complicated and ugly. The code we wrote in the last chapter to find the user with the highest rate of tweets was simple in conception, but pretty ugly visually. You may remember all the steps if you just wrote them five minutes ago, but you're going to struggle when you review the code tomorrow.

We've been using **variables** to "label our data". We're going to do the same thing with our routines: wrapping them up in a **method** call that can be invoked with a human-readable name.

## How methods are made

Here's a very simple method:

```
def hello_world
	return "Hello world"
end
```

TK copy and paste


### Methods with arguments







## Naming methods

Like variables, you want your method names to act as a quick definition of what they contain. So a method named `do_work` is virtually worth it. But `saves_report_to_disk` is pretty good, as it tells you what you need to know about the method's effect.

So it's OK to keep method names on the long side. How long is too long? It's really not about length, but about *design*. For example:

`calculates_new_totals_and_saves_report_to_disk`

The problem with that method is not the length of its name, per se, but that the method is *doing too much*: its long descriptive name is only a symptom of the problem.

A better design pattern is:

``` ruby
def calculate_new_totals(report)
	# ... 
end

def save_report_to_disk(report)
	# ...
end

def update_report_totals_(report)
	calculate_new_totals(report)
	save_report_to_disk(report)
end	

Method design is a deep topic to master. But a general rule of thumb for any given method is: do one thing and do it well. The guideline of keeping method_names short reinforces that design goal.




## Scope

For reasons too complicated to fully explain here, the variable names that you use for arguments, or that you create **inside** the method definition, are *not accessible or knowable* by the code **outside** of the definition.

In other words, the last line in this segment will cause a "variable not defined" error:

``` ruby
def hello_world
	a_word = "Bonjour"
	b_word = "Earth"
	return a_word + " " + b_word 
end

puts a_word
```

You can learn about method scope when you really delve into programming. Right now, just keep your methods simple. And a simple method doesn't talk to or know about anything outside its narrow little world.


## Exercise

Revisiting the exercise from the last chapter, write methods to calculate the "age" of a Twitter account and to find its ratio of tweeting.




Using the methods you just wrote, write a new method that lets you present the ratio as "tweets per day".




{% include_code Finding the tweetiest user lang:ruby find-tweetiest-user.rb %}




``` ruby

def calc_twitter_user_age_seconds(user_hash)
	# pre: user_hash is a Hash containing Twitter account info, including a 'created_at' attribute
	# returns: number of seconds since account created, as a decimal
	a = Time.now - Time.parse(cmember['created_at'])
	return a.to_f
end

def calc_twitter_user_age_days(user_hash)
	
end

def calc_twitter_user_tweet_rate(user_hash)
	user_hash['statuses_count'] / calc_twitter_user_age_days(user_hash) 
end
```



## Exercise

```
cmembers.each do |cmember|
	seconds_from_creation = Time.now - Time.parse(cmember['created_at'])
	cmember['tweet_rate'] = cmember['statuses_count'].to_f / seconds_from_creation	
end


most_tweety_member = cmembers[0]

cmembers.each do |member|

	if member['tweet_rate'] > most_tweety_member['tweet_rate'] 
		most_tweety_member = member
	end
	
end

```
turns to:

```

most_tweety_member = cmembers[0]

cmembers.each do |cmember|
	if calc_twitter_user_tweet_rate(cmember) > calc_twitter_user_tweet_rate(most_tweety_member)
		most_tweety_member = cmember
	end
end

```


(we're not going to write a find least/find biggest)

