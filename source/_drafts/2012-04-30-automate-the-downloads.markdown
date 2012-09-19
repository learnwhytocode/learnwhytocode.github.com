---
layout: post
title: "Automate the downloads"
date: 2012-09-12 04:30
comments: true
categories: 
problem: "How do we put everything together into a smoothly-running routine?"
solution: "Review the techniques and concepts used so far."
---

This chapter will review the concepts we've learned to design a sleek auto-tweet-downloading machine.


### What low-level, file tasks do we need to do?

Write a file to our local data directory
Read a file from our local data directory
Download from a URL
Convert a URL to a local filename
Convert a local filename to a URL


### What high-level tasks do we need to do?

1. If the data from a URL has already been downloaded from, just open the already-saved version from our local data directory.

2. Determine if a downloading-attempt was successful or not


### What tasks related to the Congressmember data do we need to do?

1. Read from the tab-delimited Congressmember datafile 

2. Create an array of Congressmember data attributes.


### What tasks related to Twitter data do we need to do?

1. Get the URL/address for the Twitter info for a given username
2. Get the URL/address for a page of tweets for a given username and a page number
3. Read and parse the JSON for a Twitter account info
4. Read and parse the JSON for a page of tweets



### What facts do we know?

1. The address of the server containing the data we want
2. The address (on that server) of a list of Congressmembers and their Twitter handles.
3. The address *structure* for a file containing Twitter account information for a given username.
4. The address *structure* for files containing tweets for a given username. 
5. The location on our hard drive where we want to store data
6. The maximum number of pages stored per Twitter account (for this practice round)

So let's put these into a file named `our-twit-constants.rb`





### 






Remember the `save_and_download` method that we wrote in a [previous chapter](TK)?




``` ruby

# def dow



```
