---
layout: post
title: "Read the columns of a spreadsheet"
date: 2012-09-12 04:23
comments: true
categories: 
problem: "We need to pick out values from a given part of each data-line"
solution: "Turn each line into its own Array of values."
---

In the last chapter, we learned how to store the [Congressmembers' sample datafile](http://so.danwin.com.s3.amazonaws.com/onacode/sunlight-foundation-congress-10.txt), line by line, into an **array**.

The problem is that we don't want a list of text lines. We want a list of Twitter usernames, which are contained *within* those text lines.

Remember that the datafile is **tab-delimited**, meaning that the values in each line are separated by the **tab-character**. Like newlines, which have a special escape sequence, `"\n"`, tab characters are represented as `"\t"`.

So let's split each line by tab character, creating an array of arrays.

First, let's get `textlines` again as we did in the last chapter:

```
require 'rubygems'
require 'httparty'

sunlight_list_url = "http://so.danwin.com.s3.amazonaws.com/onacode/sunlight-foundation-congress-10.txt"


textlines = HTTParty.get(sunlight_list_url).body
textlines = textlines.split("\n")

```

Now iterate through `textlines`, splitting each text line by the `"\t"` character and effectively turning that text line into an array. 

Then, print out the *third* value in that line-array:

``` lang:ruby

textlines.each do |line|
	cols = line.split("\t")
	puts cols[1]
end

#
1.9.3-head :017 > textlines.each do |line|
1.9.3-head :018 >     cols = line.split("\t")
1.9.3-head :019?>   puts cols[1]
1.9.3-head :020?>   end
firstname
Joseph
John
Roy
Barbara
Darrell
Joseph
Ronald
Jared
Rand
Nancy	
```





##### Exercise
Write a method named `get_twitter_name_from_line` that **accepts a single argument**: a tab-delimited data line from the Congressmembers' datafile. It should **return** the Twitter account name from that line.

For now, we'll assume that this method has no reference to the array of data lines.

``` lang:ruby First attempt at get_twitter_name_from_line method

def get_twitter_name_from_line(line)
	line.split("\t")[TK9]
end
```


What if in a new datafile, the position of the column for Twitter names changes? Rewrite this method to get the Twitter account name *without* using a hard-coded variable for the column position. This means it will take in two arguments: 

1. The line of data
2. An array of headers

Use the `index` method that's part of the `Array` class.

``` lang:ruby Second attempt at get_twitter_name_from_line method

def get_twitter_name_from_line(line, array_of_column_names)
	col_idx = array_of_column_names.index['TKtwittercolname']
	line.split("\t")[col_idx]
end
```


Why limit ourselves to extracting data from just the Twitter account column? Write a method named  `get_column_value_from_line` which returns the value from any given column from any given line. This will now require **three** arguments:

1. The line of data
2. An array of headers
3. The column name

``` lang:ruby The get_column_value_from_line method
def get_column_value_from_line(line, array_of_column_names, col_name)
	col_idx = array_of_column_names.index[col_name]
	line.split("\t")[col_idx]
end
```


Rewrite `get_twitter_name_from_line` so that it calls `get_column_value_from_line`. You should be able to rewrite it so that it accepts only *two* arguments.

``` lang:ruby Third attempt at get_twitter_name_from_line method
def get_twitter_name_from_line(line, array_of_column_names)
	get_column_value_from_line(line, array_of_column_names, "TKtwittercolname")
end
```

While you were doing the above exercises, something should have smelled a little funny about all this code. We basically want to extract a *cell* from a *row* of data, yet with every call to `get_twitter_name_from_line`, we're recalculating column positions. Unless the datafile is changing *while the program runs* &ndash; unlikely &ndash; we should only have to calculate those once.

So how should we cut down on this repeated calculation (even though the method definition helps us abstract it away)? We could set a constant somewhere at the time the data file is loaded. We could learn more about object-oriented programming to do it the "best practices" way.

The former way is clunky, because it requires us to write methods that are not very abstract. And the latter path isn't feasible in a beginner's tutorial. But in the next chapter, we'll learn one more useful collection object: the `Hash`. 
