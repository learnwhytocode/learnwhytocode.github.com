---
layout: post
title: "Read a list"
date: 2012-09-12 04:21
comments: true
categories: 
problem: "We don't want to manually enter each line of a datafile into our program."
solution: "Read each line of a datafile into an Array object."
---

So we know how to download a lot of Twitter URLs really quickly. All we need is a list of Twitter account names.

We have such a list from the [Sunlight Foundation](http://services.sunlightlabs.com/). For the purposes of practice, I've cut it down to just ten Congressmembers. You can see the sample list at this URL:

[http://so.danwin.com/onacode/sunlight-foundation-congress-10.txt](http://so.danwin.com/onacode/sunlight-foundation-congress-10.txt)

Take [a look at it](http://so.danwin.com/onacode/sunlight-foundation-congress-10.txt). It should look something like this:

<code>
title	firstname	middlename	lastname	name_suffix	nickname	party	state	district	in_office	gender	phone	fax	website	webform	congress_office	bioguide_id	votesmart_id	fec_id	govtrack_id	crp_id	twitter_id	congresspedia_url	youtube_url	facebook_id	official_rss	senate_class	birthdate
Sen	Joseph	R.	Biden	Jr.		D	DE	Senior Seat	0	M						B000444	53279	S8DE00012	300008	N00001669	joebiden	http://www.opencongress.org/wiki/Joseph_Biden				II	11/20/42
Rep	John	A.	Boehner			R	OH	8	1	M	202-225-6205	202-225-0704	http://johnboehner.house.gov/	http://www.johnboehner.house.gov/Contact/	1011 Longworth House Office Building	B000589	27015	H0OH08029	400036	N00003675	SpeakerBoehner	http://www.opencongress.org/wiki/John_Boehner	http://www.youtube.com/JohnBoehner	johnboehner			11/17/49
</code>


It looks like a bunch of jumbled text and we'll organize it in the next chapter. But there *are* Twitter usernames there.

At this point, you could do it the non-programmer way, which is to search for the Twitter handles and copy and paste each one into your tweet downloading program.

But we didn't come this far to copy-and-paste 500 names or even just 10 names, as the case may be. 

How can we get this list of names into some kind of loopable operation?


## Reading the lines of a file

First, let's download the file. You can use the downloading methods we've written in the past. I'll just make a `HTTParty` call:

```
require 'rubygems'
require 'httparty'

sunlight_list_url = "http://so.danwin.com/onacode/sunlight-foundation-congress-10.txt"


textlines = HTTParty.get(sunlight_list_url).body
```

That mess inside `textlines` now looks like this:

<code>
"title\tfirstname\tmiddlename\tlastname\tname_suffix\tnickname\tparty\tstate\tdistrict\tin_office\tgender\tphone\tfax\twebsite\twebform\tcongress_office\tbioguide_id\tvotesmart_id\tfec_id\tgovtrack_id\tcrp_id\ttwitter_id\tcongresspedia_url\tyoutube_url\tfacebook_id\tofficial_rss\tsenate_class\tbirthdate\nSen\tJoseph\tR.\tBiden\tJr.\t\tD\tDE\tSenior Seat\t0\tM\t\t\t\t\t\tB000444\t53279\tS8DE00012\t300008\tN00001669\tjoebiden\thttp://www.opencongress.org/wiki/Joseph_Biden\t\t\t\tII\t11/20/42\nRep\tJohn\tA.\tBoehner\t\t\tR\tOH\t8\t1\tM\t202-225-6205\t202-225-0704\thttp://johnboehner.house.gov/\thttp://www.johnboehner.house.gov/Contact/\t1011 Longworth House Office Building\tB000589\t27015\tH0OH08029\t400036\tN00003675\tSpeakerBoehner\thttp://www.opencongress.org/wiki/John_Boehner\thttp://www.youtube.com/JohnBoehner\tjohnboehner\t\t\t11/17/49\nSen\tRoy\t\tBlunt\t..."
</code>

Where did all the line breaks go? In Ruby strings, newlines are just characters. And in this case, they are represented by a backslash character, `\`, combined with the letter `n`:

`\n`

That **backslash** has a special meaning in Ruby strings. It acts as an **escape character**, and it affects the character that immediately follows it. In this case, this is the letter `n`. 

In other words, `\n` is not just a normal, literal `n` character, but the symbol for a **newline**, i.e. a line break.


### Counting rows

So it seems that if we could break apart the giant string that is `textlines` on the character `\n`, we'll get rows.

Lucky for us, there is a `split` method for strings (see the [documentation here](http://www.ruby-doc.org/core-1.9.3/String.html)).

**Note:** you *must* use double quotes here when enclosing the `\n` character.

``` ruby irb
1.9.3-head :018 > rows = textlines.split("\n")
1.9.3-head :018 > rows.class
 => Array 
1.9.3-head :019 > rows.length
 => 11 
```

## The Array

Apparently the `split` method returns a data object of `Array` class.

Arrays happen to be another type of collection object, just as `Range` is.

Which means we can loop across it in the same way. The sequence below simply prints out the length of each member of `rows` (a line of text, i.e. a `String`):


``` ruby irb
1.9.3-head :020 > rows.each do |row|
1.9.3-head :021 >     puts row.length
1.9.3-head :022?>   end
276
161
327
338
331
336
382
316
302
264
319
```

If a `Range` was a collection of numbers, think of the `Array` class as a collection of objects. Those objects could be anything: numbers, strings, other collections, even. In the Python language, arrays are referred to as **lists**, and that name works as well.


## Array addressing

What if we just wanted to print out the first line? Or the fourth line?

This is the notation for addressing specific elements in an array:

```
row[0]	# refers to the first element
row[3]	# refers to the fourth element
row[4]	# refers to the fifth element
```


In the next chapter, we'll get more into detail with Arrays. But now we know how to read from a list.

##### Exercise

Given the following string:

``` ruby
str = "1,6,8,12,40,a,b,c,d,e,42,Adams"
```

Find:

1. The number of comma-delimited values
2. The 7th value


##### Answer
```
str = "1,6,8,12,40,a,b,c,d,e,42,Adams"
arr = str.split(",")

puts arr.length 	#=> 12
puts arr[8]			#=> d
```




