---
layout: post
title: "Switching data locations"
date: 2012-09-12 03:18
comments: true
categories: 
problem: "The data source just up and changed its location!"
solution: "Thanks to how we abstracted and organized our code, we need modify just a few details to adapt."
---

As I said at the outset, we're working with a very small sample of Twitter's data, and we're not using its official API.

At some point, you're going to want to remove the training wheels and get data straight from the source.

We won't get to that in this tutorial, but we'll go through the motions. I'm going to change up the data source and show you how our **my_code.rb** can adapt to it.


## More data, more problems

Good news. Instead of just looking at the same 10 congressmembers over and over, I have a data file of roughly 500 U.S. politicians.

But rather than have you hit up my server repeatedly, I'm just going to give you the data in bulk. This will make things much faster for you, as you won't have the latency of an Internet connection: you'll be combing through the data as it sits on your hard drive.

The bad news is that you're going to have to adapt.


### Download the data

The full dataset (which is not even quite complete, but more on that later) is more than 300MB. You can download it [here TK](TK). If you have a fast computer, sure, go for it.

However, because we're still just practicing, there's not really a need to process tens of thousands of tweets. So here's a subset, about TK MB: [TK](TK). It contains the same number of Twitter accounts to process, just fewer tweets.


The best place to store this data is as a **sub-directory** in your **working directory**.

I'm going to assume you're naming it **data-hold**.

So unzip the data-file into **data-hold**, and it should create some familiar sub-directories, including **users** and **statuses**


## Making adjustments

Let's look at the current state of our **my_code.rb** file:

{% include_code Our common code wrapper-methods/my_code.rb %}

The most obvious adjustment is to change the value of the `TWITTER_DATA_HOST` to the **data-hold** sub-directory:

``` ruby
TWITTER_DATA_HOST = File.expand_path('data-hold')
```

(try out the `File.expand_path` method in **irb** to see what it does)


### Well-laid plans

With that simple change, we are *almost* done with the needed adjustments.

This is because we wisely created the `url_for` methods to rely on the `TWITTER_USER_DATA_PATH` and `TWITTER_TWEETS_DATA_PATH` constants.

And what do those constants depend on? The value of `TWITTER_DATA_HOST`, since the user and tweets data paths are merely sub-directories of the base location.

Pretty nifty.

## A different get method

Unfortunately, there is one major change to make.

Retrieving a file from the Internet is not exactly the same as getting it from your own hard drive. For starters, `HTTParty` won't work.

Instead, we use the `File.open` (part of Ruby's core library), which acts a bit differently:

``` ruby
some_filename = url_for_twitter_user_info('NancyPelosi')
fh = File.open(some_filename, 'r')
fbody = fh.read
fh.close

# ...parse fbody
```

## Exercise

Make the necessary changes to **my_code.rb** to adapt to the change in data source.

{% include_code Our common code for local data local-data-env/my_code_alpha.rb %}


With this modified **my_code.rb**, test it out on your local data store. Things should seem pretty much the same.

```
load `./my_code.rb`

t_user = get_twitter_user('DarellIssaTK')
puts t_user['followers_count']

```

I guess we could change the names of the `url_for` methods...since they don't actually refer to web addresses. But that's the beauty of abstraction: we don't need to worry about such details as long as things work as expected.




