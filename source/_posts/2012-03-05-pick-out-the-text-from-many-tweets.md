---
layout: post
title: "Pick out the text from many tweets"
date: 2012-09-12 03:05
comments: true
categories: 
problem: "How do we work with the JSON for a page of tweets?"
solution: "Because a page of tweets can contain many tweets, they are stored as arrays"
---

In the last chapter, we dealt with the Twitter user data object, which when parsed, is a Ruby `Hash`.

But the data object for a page of tweets is different:

``` ruby
require 'rubygems'
require 'json'
require 'httparty'

url = "TK"
json_str = HTTParty.get(url).body
tweets_obj = JSON.parse(json_str)

puts tweets_obj.class
# => Array
```

If you look at the contents of the JSON in `tweets_obj`, you should see something that looks like a collection of `Hash` objects. But what exactly is this `Array` that holds them?


## The Array object

In Python, arrays are known as **lists**, which may be the easier way to think of this type of **collection**. Like the `Hash`, the `Array` is a collection of objects. However, instead of using **keys**, the objects in `Array` can be accessed (using the same kind of square-bracket notation) in a numerically sequential order.

Here's a sample `Array`:

``` ruby
arr = ['a', 'beta', 'cow', 'dog']
puts arr[0]
#=> a

puts arr[2]
#=> cow
```

We'll examine arrays in greater detail later. For now, note:

1. Array items are accessed with integers. They don't use strings or other types of data-objects (as a `Hash` can)

2. A Ruby array is zero-indexed. That means the first element is found at the address of `0`. The second element is at `1`, and so forth.


## Collections inside collections

The string and number datatypes are primitive compared to the collection datatypes. As an example, the `tweets_obj` array contains a bunch of objects, and if you inspect each object, you'll see that each is itself a `Hash`:

``` ruby
x =  tweets_obj[0]
puts x.class
#=> Hash

y = tweets_obj[0]
puts y.class
#=> Hash
```
In other words, each individual Tweet is represented as a `Hash`

## Exercise

Look over the downloaded JSON to see the structure of the Tweet hash object. Print out the following:

1. The text of the first tweet
2. The number of retweets of the eighth tweet
3. The date of the 14th tweet


### Answer


```
puts tweets_obj[0]['text']
puts tweets_obj[7]['retweet_count']
puts tweets_obj[14]['created_at']
```


