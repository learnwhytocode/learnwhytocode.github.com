---
layout: post
title: "Find the needle in the hay."
date: 2012-09-12 04:10
comments: true
categories: 
problem: "We want to find something specific in this collection"
solution: "Use an if/else statement."
---




---

old
Re-examine the answer to the last chapter's loop problem:

{% include_code loop-and-repeat/answer.rb %}


How exactly did we know to go from `1` to `3`? Because I told you that there were exactly `3` files to download.

But we won't have that luxury in the real world of data-gathering. So learning about loops gave us a new problem: how do we stop the loop if we don't know the stopping condition *beforehand*?


Try downloading the non-existent page `4` of tweets for Twitter user `joebiden`:

```
TK
```

You can try it for `5`, `6`, `7` and so on, and the response will be similar.

So if the response for a page fetch looks like TK, then it's safe to assume that there are no more pages for a given user. Let's use that as a condition of breaking out of the loop.



## if

The `if` keyword, nearly ubiquitous across all modern programming languages, lets us state a **condition** that we want to *affect* how our program *flows*. In effect, we are creating a *branch* in our otherwise straight-and-narrow program execution, and the `if` lets us describe which path our program should choose.

This is especially necessary for occasions, as in the problem of this chapter, when we can't decide for our program *beforehand*.

Examine this simple method definition:

``` ruby
def number_as_percentage(val)
	if val < 1
		val = val * 100.0
	end
	
	return val.to_s + '%'
end

1.9.3p258 :008 > number_as_percentage(12)
 => "12%" 
1.9.3p258 :009 > number_as_percentage(150)
 => "150%" 
1.9.3p258 :010 > number_as_percentage(0.2)
 => "20.0%" 
```


Whenever the input to `number_as_percentage` is *greater than* `1`, the method returns the number converted to a string with a percent sign appended to it.

However, **if** the argument is *less than 1*, then the method enters an optional **branch**, in which the variable `val` is reassigned to the result of itself multiplied by `100.0`. Why would anyone design such a method? Maybe it's for a web form in which people are asked to enter the "percentage" of something and many of them enter `0.25` when they really mean `"25%"`

Either way, this is a really dumb implementation; what happens when the input is *less than* `0`? But don't worry about that, just worry about the use of `if`:

```
if val < 1
	val = val * 100.0
end
```

What follows the `if` is a **condition**, which can be read in English as: *the value of `val` is less than 1*. If that condition is `true`, then the code between the `if` line and the `end` is executed. If that condition is `false`, then that `if` code is skipped entirely.


## About true and false

Very briefly, the words `true` and `false` are special keywords in the Ruby language. So don't use them as variable names. And don't confuse them with the strings `"true"` and `"false"`.

You will get `true` and `false` objects when you execute a statement that tests a condition:

```
50 < 12
# => false 
50 > 12
# => true 
50 == 50
# => true 
"dog" == "cat"
 => false 
```

Hopefully you remember those *greater than* and *less than* symbols from math class. Of special note is the double equals sign `==`, also known as the **equality operator**. Do *not* confuse it with the **assignment operator** &ndash; the single equals sign &ndash; though you probably will as do many experienced programmers in their careers.


### else

Sometimes we want an alternative besides 'just skip the `if` block'. That is where `else` comes in:


```
def even_or_odd(num)
	if num % 2 == 1
		return "odd"
	else
		return "even"
	end	
end
```

When the `if` statement is false, the code after the `else` statement executes (that `%` symbol is how you find the **remainder** when dividing two numbers.)


### elsif

What if you have more than two possible outcomes? The `elsif` lets you state additional conditions and outcomes:


```
def even_or_odd(num)
	if num % 2 == 1
		return "odd"
	elsif num == 0
		return "zero"
	else
		return "even"
	end	
end
```

##### Exercise

Write a method named `is_valid_http_response` that:  
1. Accepts one argument: the result from a `HTTParty.get` call.
2. returns `true` or `false` depending if it was a successful call


```
def is_valid_http_response(resp)
	resp.code != 200
end
```

There are different ways we could choose a condition for this method. Due to how `HTTParty` works, we just have to check to see if the code is 200. Read this for [more background on HTTP codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).




**How to break a loop:** Here's how the keyword `break` is used to *break* out of a loop:


```
(1..20).each do |n|
	puts n
	if n > 7
		puts "Oops, supposed to be under 7"
		break
	end
end

# irb: 

1
2
3
4
5
6
7
8
Oops, supposed to be under 7
```

Write a method named `fetch_all_tweets_for_user` that:
1. Accepts a single argument
2. Loops no more than `20` times to download and save tweet pages for a user
3. If you come across a non-existent page *before* the counter hits `20`, `break` out of the loop
4. Use the `is_valid_http_response` method

And one more twist. Remember the `download_and_save` method?

```
def download_and_save(url)
	content = download_from_url(url)
	filename = url_to_local_filename(url)
	my_file_writer(filename, content)
	
	return content
end
```

We can't really use this. Look at the definition for `download_from_url` to have a better idea. Basically, we would download from a given URL *twice*: once to check for a valid response. And once again, since `download_from_url` is invoked by `download_and_save` to actually get the `content` to save.

If you don't understand that, don't worry. Just have `fetch_all_tweets_for_user` include functionality to write to your hard drive.




##### Answer

The complete answer, including previous method definitions:

{% include_code if-this/answer.rb %}

