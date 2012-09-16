---
layout: post
title: "Changing the data environment"
date: 2012-09-12 05:00
comments: true
categories: 
problem: "What happens when the location of the data changes?"
solution: "We simply change some variables and the methods we've designed."
---

TK: Do I introduce constants in the make method?

In the [project description](TK), I said we weren't actually using the Twitter API for logistical reasons, and that is why we've been pulling from a datasource with a similar pattern than what Twitter uses.


``` lang:ruby
# TK this should be in make-methods chapter

# `http://TK_DATA_ROOT_PATH/users/TKRepPaulRyan/show.json`

def twitter_account_info_path(screen_name)
	_twitter_root_data_path = 'http://TK_DATA_ROOT_PATH'
		
	path = File.join(_twitter_root_data_path, 'users', screen_name, 'show.json')
end

```

What happens when you want to use Twitter's actual API? For version 1, then we simply change the definition of our `twitter_account_info_path` method:

``` lang:ruby

def twitter_account_info_path(screen_name)
	_twitter_root_data_path = 'https://api.twitter.com/TK'
	_twitter_account_data_path = 'users/show.json?screen_name='
	
		
	path = File.join(_twitter_root_data_path, _twitter_account_data_path) + screen_name
end

```

# TK do irb to execute this


In a few months, you'll have to move to [version 1.1](TKdocs) of Twitter's API. So you'll have to adjust `twitter_account_info_path` once again:


``` lang:ruby

def twitter_account_info_path(screen_name)
	_twitter_root_data_path = 'https://api.twitter.com/TK'
	_twitter_account_data_path = 'users/show.json?screen_name='
	
		
	path = File.join(_twitter_root_data_path, _twitter_account_data_path) + screen_name
end

```


Additionally, version 1.1 requires a different authentication step, which means the download process won't be as simple as a `HTTParty.get`. This is why it was useful to move the downloading functionality to its own method, `download_twitter_data_url` (for the sake of brevity, I won't go into the details of how to do this for v1.1).



## Going local

The data we've used so far located at `http://TK_DATA_ROOT_PATH` has only been a subset of a few URLs. This is because my server's bandwidth is limited and I figured it'd be faster to just *give* you the data in bulk.

So for the purposes of this tutorial, we won't be moving over to the Twitter API. But we will be moving the location of the data from my **limited-bandwidth server over to your hard drive**, so that you can perform queries without the latency of Internet access.

This is not such a contrived circumstance. Think of it as your colleague handing you a giant database he/she has compiled for offline use. The time it takes to revise your methods is more than made up by increase in data access speed.

### Setting up the local data storage

1. Wherever you've been storing the code for this tutorial, **create a directory named** `data-hold`. You can do this in the GUI or be adventurous and find the Ruby method that does it. 

2. Download [TK.zip](TK) into that `data-hold` directory. This contains all the data we'll be using for the remainder of this lesson.

3. Unzip the **TK.zip** file, which should automatically create the sub-directories and populate them with the data files.

Here are the changes in data paths:

1. Twitter account info is at `data-hold/TKTWITTER/users/_USERNAME_/user_timeline.json` instead of `http://TK_DATA_ROOT_PATH/users/_USERNAME_/user_timeline.json`  
2. Tweet pages are at `data-hold/TKTWITTER/users/_USERNAME_` instead of `http://TK_DATA_ROOT_PATH/statuses/_USERNAME_/_PAGENUM_`
3. The datafile containing the Congressmembers' info is at TK instead of TK


## Making changes


Since all the paths are now local, what is the purpose of `get_local_fname_from_url`?

We don't want to call `CGI.escape` on a local path, or else we get:


```
1.9.3p258 :012 > CGI.escape('/perfectly/fine/local_path')
 => "%2Fperfectly%2Ffine%2Flocal_path"
```

So we *could* just remove the `get_local_fname_from_url` method entirely. But this would break at least one other method &ndash; `get_and_save_from_url` &ndash; which refers to it.

So we *could* remove that reference. But then that requires changing the logic of `get_and_save_from_url`, such as removing the `if/else` statements.

What a pain, right?

There is a better alternative: we could rewrite `get_local_fname_from_url` to *not do anything* when the argument passed into it is *already* a local filename. Because `get_and_save_from_url`





 they no longer need to have `CGI.escape` called on them. We *could* remove that escaping functionality. But what if this method will be used on web URLs in the future?

The value that `ROOT_TWITTER_DATA_PATH` points to has to be changed

The method `twitter_account_info_path` should remain the same

The `TKget_andsave` should be the same. Even if we stick to the local datafiles and hence, never have to use `HTTParty.get`, the method should behave the same. Sure, we could remove any reference to `HTTParty.get`, but what if we later decide to download from an online source?




(conclusion)
Nothing is constant in life and so it is with digital information. Luckily, adapting to changes in the digital data world can be as easy as re-tuning an existing method. If we



 