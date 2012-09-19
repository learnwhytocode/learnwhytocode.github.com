---
layout: post
title: "Handle JSON files"
date: 2012-09-12 03:01
comments: true
categories: 
problem: "How do we deal with JSON data files?"
solution: "Use Ruby's JSON library"
---
 
In the last chapter, we learned how to download a file using HTTParty and save its contents to a variable:


```
require 'rubygems'
require 'HTTParty'

url = "http://nottwitter.danwin.com/users/NancyPelosi/show.json"
downloaded_file = HTTParty.get(url)

```

But when we examine the results (you can visit the [show.json file in your browser](http://nottwitter.danwin.com/users/NancyPelosi/show.json)), you'll find a strange arrangement of text:


``` plain
{
  "id": 15764644,
  "id_str": "15764644",
  "name": "Nancy Pelosi",
  "screen_name": "NancyPelosi",
  "location": "San Francisco & DC",
  "url": "http://www.democraticleader.gov/",
  "description": "Democratic Leader, focused on strengthening America's middle class and creating jobs; mother, grandmother, dark chocolate connoisseur.",
  "protected": false,
  "followers_count": 226259,
  "friends_count": 225,
  "listed_count": 6288,
  "created_at": "Thu Aug 07 15:35:02 +0000 2008",
  "favourites_count": 0,
  "utc_offset": -28800,
  "time_zone": "Pacific Time (US & Canada)",
  "geo_enabled": false,
  "verified": true,
  "statuses_count": 1029,
  "lang": "en",
  "contributors_enabled": false,
  "is_translator": false,
  "profile_background_color": "FFFFFF",
  "profile_background_image_url": "http://a0.twimg.com/profile_background_images/188759788/newtwitterbg.jpg",
  "profile_background_image_url_https": "https://si0.twimg.com/profile_background_images/188759788/newtwitterbg.jpg",
  "profile_background_tile": false,
  "profile_image_url": "http://a0.twimg.com/profile_images/1681806248/npmic4twitter_normal.jpg",
  "profile_image_url_https": "https://si0.twimg.com/profile_images/1681806248/npmic4twitter_normal.jpg",
  "profile_link_color": "1B5363",
  "profile_sidebar_border_color": "E8E8E8",
  "profile_sidebar_fill_color": "FCFCFC",
  "profile_text_color": "333333",
  "profile_use_background_image": true,
  "show_all_inline_media": false,
  "default_profile": false,
  "default_profile_image": false,
  "following": null,
  "follow_request_sent": null,
  "notifications": null
}
```

At second glance, it's not too hard to figure out what's going on here. This **json** file contains some kind of listing of attributes for Rep. Nancy Pelosi's Twitter account. For example:

`"followers_count": 226259`

We can guess that this line indicates that Rep. Pelosi has 226,259 followers.


## What is JSON?

JSON stands for "[JavaScript Object Notation](http://en.wikipedia.org/wiki/JSON)". It is simply a lightweight data format and is a common way for web services to pass around data.

The actual details of JSON's structure aren't important to learn right now. We just want to know: how can we turn this text file to usable data?

If you're following the steps from the beginning of this chapter, you have a `downloaded_file` variable that contains downloaded JSON. Exactly what is contained in `downloaded_file`?

(remember that `downloaded_file` is actually an object with a class of HTTParty::Response, so use its `body` method)

```
1.9.3p258 :006 > downloaded_file.body.class
 => String 
```

## Data is organized text

As you get more experienced in collecting digital data, one *fundamental concept* to understand is that data is all just text (actually `1`s and `0s` but no need to go that deep).

The JSON file we just downloaded is just a large string.

Getting useful data out of this text &ndash; whether it's comma-delimited files, Excel spreadsheets, JSON, or SQL &ndash; is just a matter of finding a pattern in the file and breaking it apart.

We'll figure out this pattern later. For now, let's see if someone has already written the code to interpret JSON files for us.


## The json gem


(TK parse exercise)

## Write our own methods


##### Exercise

Write a `download_and_parse_json` method that, given a url to a json file, returns the result of `JSON.parse`.


##### Answer





