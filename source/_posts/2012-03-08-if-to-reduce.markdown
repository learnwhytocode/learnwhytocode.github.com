---
layout: post
title: "Finding the most, least, biggest, smallest"
date: 2012-09-12 03:08
comments: true
categories: 
problem: "We want to find the Congressmember with the most followers."
solution: "Use the if statement to add logic to your program."
---

## Do something on if

Printing out a list of tweets or users is useful. But maybe we just want to find one tweet. Or a particular user. On Twitter, we're usually interested in how many followers another account has amassed. 

So how do we pick out that one standout item?

Let's start off by grabbing all the account names from last chapter's sample list. Then loop through that list and retrieve the **user info** for each account name. Then parse the JSON and store the object into an array. 

We'll use this array (call it `cmembers`) for the rest of the chapter.


### Adding to an array

We've been building arrays using the `split` method of a string. If we want to create an `Array` from scratch, initializing it is as easy as:

``` ruby
arr = []
```

To add members to `arr`, you can "push" objects into the array with the `<<` (TK html entity) operator.

Or you can specify an address for each object using the bracket notation; both methods are shown below:

``` ruby
arr << 'apple'
arr << 'bass'
arr << 'cow'
arr[5] = "road"

puts arr[1]
# => cow

puts arr[5]
# => road
```

The code to create array `cmembers` containing the Hash object representation of each Twitter account is as follows:

``` ruby

require 'rubygems'
require 'json'
require 'httparty'

HOST_PATH = http://nottwitter.danwin.com/
list_url = File.join(HOST_PATH, "simple-congress-list.txt")

cmembers = []

str = HTTParty.get(list_url).body
str.split("\n").each_with_index do |name|
	user_json_url = File.join(HOST_PATH, "users", name, 'show.json')
	user_json = HTTParty.get(user_json_url).body
	user_obj = JSON.parse(user_json)
	cmembers << user_obj
end
```

As a quick practice, write the code that loops through `cmembers` and prints only the number of followers:

``` ruby
cmembers.each do |member|
	puts cmember['followers_count']
end
```

## Comparisons and true and false

To find the most followed user on this list, we need some way of distinguishing a *more*-followed user from a *less*-followed user. Remember this from grade school math?

`1 + 1 < 5`

Try running this comparison operation in Ruby. Then switch the sign to the other direction and see the result.

``` ruby
1 + 1 < 5
#=> true

1 + 1 > 5
#=> false
```

If you inspect the class of these `true` and `false` objects, you'll see that they are not strings, but objects of their own unique type. 

For this lesson, all we need to know is `greater than` and `less than` operators. But in the future, we may be using these **equality** operators:

``` ruby
1 == 1
#=> true

1 == "1"
#=> false

1 != 1
#=> false

1 == "1".to_i
#=> true
```

A common beginner's (and professional's) mistake is to confuse the equality operator, `==`, with the assignment operator, `=`

## The if statement

Enter this into **irb**:

``` ruby
val = 42

if val > 10
	puts "The number " + val.to_s + " is greater than 10"
end
```

The output should be:

`The number 42 is greater than 10`	

Now assign `val` to `5` and run the same routine. What happened?

The statement `The number 5 is greater than 10` should *not* have been printed.

### Conditional branches

What follows the `if` keyword is a **condition**, which can be read in English as: *the value of `val` is greater than 10*. If that condition is `true`, then the code between the `if` line and the `end` is executed (the statement is `puts`). 

However, if that condition is `false`, then that `if` code is skipped entirely.

Think of `if` as creating a fork in the road, letting your program diverge onto a different path.

Let's practice on the `cmember` array. Use an `if` statement to print *only* the account names that begin with a letter `J` or *after*, alphabetically speaking (yes, strings can be compared).

And remember that `cmembers` contains `Hash` objects, so you'll need to access their `'screen_name'` attribute.

``` ruby

cmember.each do |c|
	if c['screen_name'] > 'J'
		puts c['screen_name']
	end
end	

```

## Finding the most

We now know all we need to find the most followed user.

In abstract terms, what are we trying to do? We're trying to *reduce* this collection to a single member, the member with the most followers.

We can use a variable to store what is currently the most followed member through each execution of the loop. Then with some comparison logic, that variable will contain the member we want at the end of the loop:

``` ruby
# initialize a variable with the first member:

most_followed_member = cmembers[0]

cmembers.each do |member|

	if member['followers_count'] > most_followed_member['followers_count'].to_i 
		most_followed_member = member
	end
	
end	
```

Note how we had to convert the `'followers_count'` value to a number. Try comparing the values of `"9"` and `"1000"` to see how strings are compared *alphabetically*, not *numerically*.





## Exercise

Find the Congressmember with the highest **rate of tweets**.

For this, you'll want to require the `'time'` library. Check out the [documentation](http://www.ruby-doc.org/core-1.9.3/Time.html):

``` ruby
Time.now
 => 2012-09-19 07:23:39 -0400
Time.parse("Sep. 1, 2012")
 => 2012-09-01 00:00:00 -0400

Time.now.to_i 
# => 1348053886 

Time.now - Time.parse("Sep. 1, 2012")
# => 1581937.303837

# TK (works in Ruby 1.8.7?)
```

Check out the Twitter user account info to find the attributes relating to number of tweets and when a user account was created.


### Answer

{% include_code Finding the tweetiest user lang:ruby find-tweetiest-user.rb %}



A few points: 

1. Like Arrays, you can assign values to a Hash object using the bracket notation.
2. Given that the number of seconds that a user account has existed will likely always be greater than the number of tweets they have, you have to work with `Float` (decimal) numbers and the `to_f` conversion
3. This can be done in one loop. I was just breaking out the steps.
4. There's a much easier way to sort values, but we'll get to that later.

```


