




---- 
old 
Now that we have a nice routine for downloading and saving a file, let's use it to retrieve the first three pages of tweets from the user named `joebiden`.

Here again is the URL pattern for tweet pages in our tutorial:
`http://TK_DATA_ROOT_PATH/statuses/_USER_NAME/_PAGENUM_/user_timeline.json`

Now to download them using our pre-written methods:

``` ruby

load './my-first-methods.rb'

url_pattern = "http://TK_DATA_ROOT_PATH/statuses/_USER_NAME/_PAGENUM_/user_timeline.json"
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

Collections have a method called `each`, which, as we saw above, iterates through each member of a collection. The `do` and `end` keywords denote the block of code performed in each iteration. And think of the `|num|` as the **argument** passed into that block of code.

Let's practice. Using a `Range` and the `each` method, print out the URLs needed to retrieve the three `joebiden` tweet pages:

```
biden_pattern = "http://TK_DATA_ROOT_PATH/statuses/joe_biden/_PAGENUM_/user_timeline.json"

(1..3).each do |page_num|
	url = biden_pattern.sub("_PAGENUM_", page_num.to_s)
	puts url
end
```


Up until now, we've basically been *entering* code equivalent to the amount of work that we actually want to do. With loops, you can see how actions can be repeated dozens, thousands, millions of times with a simple change to a collection.


##### Exercise

Revisit the problem we attempted at the beginning of the chapter &ndash; downloading 3 pages of `joebiden` tweets &ndash; but use a `Range` and the `each` method.


##### Answer

{% include_code loop-and-repeat/answer.rb %}

