---
layout: post
title: "Transforming collections"
date: 2012-09-12 05:28
comments: true
categories: 
problem: "How do we get just the text of the tweets belonging to a Congressmember? Or an array of the length of tweets?"
solution: "Use Ruby's map method to transform a collection of data"
---

Think of the `Hash` and `Array` objects as **collections**. Hence, each line we parse using `FasterCSV` is a **collection**. Each JSON file that we parse may consist of *collections* nested inside other *collections*.

Sometimes, we just want *one* value from a collection, just like when we wanted the Twitter account names from each line in the Congressmembers' datafile. To make an array of these values, we can use `each` to fill a new array.

TK

## Mapping values

This is such a common pattern, though, that Ruby collections have a method named `map` (also aliased as `collect`) that returns an array:

TK




The `do` and `end` notation is a little confusing when we're assigning the result of a method, so we can use the **curly braces** notation (we could also do this with `each`):

TK


### Blocks

When we first learned about `each`, we didn't get into technical details, it was just satisfying enough to be able to loop through things.

But with the `map` method, it's worth a little more discussion: What's going on between the `do` and `end` &ndash; or the two curly braces &ndash; is a code block that acts similar to the code blocks we've been using in our methods.

The variables named between the pipe characters are similar in function to the **arguments** we passed into our methods.

When `map` and `each` are invoked by a collection, that "argument" is a particular member of that collection, which changes with each iteration of the loop.

This is a vastly simplified explanation (not going to get into **closures** for this tutorial), but there is one important similarity between the methods we've written and the code blocks used by `map`: the last line is the **returned** value.

For example, given an array of words, I want an array of those words *capitalized*. Using `map`:

``` ruby

new_arr  = ["dog", "cat", "apple"].map{|a| a.upcase}
puts new_arr.join(", ")
# => DOG, CAT, APPLE

```

To re-emphasize:

``` ruby
new_arr  = ["dog", "cat", "apple"].map{|a| 
	b = "this line is irrelevant " + a
	a.upcase
}
puts new_arr.join(", ")
# => DOG, CAT, APPLE
```


##### Exercises


Using the `get_all_tweets_for` method we wrote in the previous chapter, use the `map` method to return an array of just the *text* of a user's tweets.

Use the `map` method to transform the array of tweet text into an array of values representing the `length` of each text string.









