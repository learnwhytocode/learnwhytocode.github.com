---
layout: post
title: "Loop and repeat"
date: 2012-09-12 04:05
comments: true
categories: 
problem: "We're doing the same thing, over and over, with just a minor change each time."
solution: "Use a loop to repeat commands as many times as we need."
---


Now that we have a nice routine for downloading and saving a file, let's use it to retrieve the first three pages of tweets from the user named `joebiden`.

Here again is the URL pattern for tweet pages in our tutorial:
`http://TK_DATA_ROOT_PATH/statuses/_USER_NAME/_PAGENUM_/user_timeline.json`

Now to download them using our pre-written methods:

``` ruby

load './my-first-methods.rb'

url_pattern = `http://TK_DATA_ROOT_PATH/statuses/_USER_NAME/_PAGENUM_/user_timeline.json`
screen_name = "joebiden"


url_1 = url_pattern.sub("_USER_NAME_", screen_name).sub("_PAGENUM_", '1')
download_and_save(url_1)

url_2 = url_pattern.sub("_USER_NAME_", screen_name).sub("_PAGENUM_", '2')
download_and_save(url_2)

url_3 = url_pattern.sub("_USER_NAME_", screen_name).sub("_PAGENUM_", '3')
download_and_save(url_3)

```

That's not a terrible amount of work to download three pages. But in our continuing quest to remove repetition, let's find a way to exploit the obvious pattern above.


## Loop with each

**Note:** Ruby, like its peer languages, has the `for` construct. We're going to skip that and use the more Ruby idiomatic `each` just for the sake of brevity.

Let's simplify the issue here: how do we count from `1` to `3`? In a programmatic way?

``` ruby
(1..3).each do |num|
	puts num
end
```

The object `1..3` is a special data class in Ruby called a `Range`. Ranges are one of several types of **collections**. After we learn about the other kinds of collections, we won't be using ranges too often. But they make for an easy introduction to loops. 

Collections have a method called `each` which allow



