---
layout: post
title: "The Project"
date: 2012-09-12 00:30
comments: true
categories: 
problem: "How to gather and analyze U.S. Congressmembers tweets"
solution: "Use programming to avoid tedious, mind-numbing data-entry"
---


## Tweet stories

It's election season and just about everyone in the information business has at least a psasing interest in what politicians are saying. And in 2012, members of Congress (or their staff) are getting comfortable (a [little too comfortable, sometimes](http://slatest.slate.com/posts/2011/06/06/anthony_weiner_photos_andrew_breitbart_publishes_photo_he_says_i_0.html)) with using Twitter as a podium.

Maybe you're a political reporter and you want to be the first to report a gaffe. If you're a social media expert, maybe you want to analyze social media usage by government. If you're a policy wonk, then you realize that Twitter provides a nicely structured stream of links to a politician's public statements, appearances, and interests.

Don't care about tweets? Then use the same patterns and techniques but with Federal Election Commission spending data or whatever you think is worth investigating. Don't want to publish a whiz-bang web visualization? Then publish your findings in a book.

All of these goals and aspirations have a common hurdle: the time sunk into the mind-numbing work of collecting and organizing data. 

The goal of this tutorial is to show how programming can vastly reduce the least interesting parts of data work so that you can focus on what you actually want to do.

## Technical details

This tutorial involves the mashing together of Twitter data with Congressional data [gathered by the Sunlight Foundation](http://services.sunlightlabs.com/). We'll use programming to collect, analyze, and publish it.

### The data format

Instead of using the Twitter API, I've prepared a small set of sample data to practice on. The data format will be the same (JSON), but the actual pattern of URLs will be different (though vaguely similar) to what you would use when fetching tweets from Twitter's service.

The two kinds of files are:


#### Account info
This is the data corresponding to a user's profile and statistics. See [Twitter API doc](https://dev.twitter.com/docs/api/1/get/users/show)

* Format: /users/_SCREENNAME_/show.json
* Example: [http://nottwitter.danwin.com/users/senatorboxer/show.json](http://nottwitter.danwin.com/users/senatorboxer/show.json)
* Equivalent [Twitter 1.0 API](https://dev.twitter.com/docs/api/1/get/users/show) call: 
 [https://api.twitter.com/1/users/show.json?screen_name=senatorboxer](https://api.twitter.com/1/users/show.json?screen_name=senatorboxer)

#### Tweet pages
Each user has a set of pages, with a max number of tweets per page (and no more than 3,200 total). See [Twitter API doc](https://dev.twitter.com/docs/api/1/get/statuses/user_timeline)

* Format: /statuses/_SCREENNAME_/_PAGE_NUM_/user_timeline.json
* Example: [http://nottwitter.danwin.com/statuses/senatorboxer/1/user_timeline.json](http://nottwitter.danwin.com/statuses/senatorboxer/1/user_timeline.json)
* Equivalent [Twitter 1.0 API](https://dev.twitter.com/docs/api/1/get/statuses/user_timeline) call: [https://api.twitter.com/1/statuses/user_timeline.json?screen_name=senatorboxer](https://api.twitter.com/1/statuses/user_timeline.json?screen_name=senatorboxer)



### The dataset scope

We begin by accessing Twitter data for **10 users** listed in this text file:

[http://nottwitter.danwin.com/simple-congress-list.txt](http://nottwitter.danwin.com/simple-congress-list.txt)

After we've gone through the ropes of basic programming routines, we move on to the full list of Congressmembers and their Twitter accounts. I used [this list](http://nottwitter.danwin.com/sunlight-foundation-congress-master.csv) that was [compiled by the Sunlight Foundation](http://services.sunlightlabs.com/).

For your convenience, I've created bulk data that can be downloaded and unzipped to your hard drive. Your scripts have to be adapted then to point from the remote `http://nottwitter.danwin.com/` domain to `/yourcomputer/working-directory/`

* [Large datasetTK](TK) (600+ MB unzipped)
* [Lite datasetTK](TK) (80+ MB unzipped)

The main difference is that the lite version has far fewer tweets per user. When testing scripts, you may find it easier to do a run through the lite version of the data to save time.

Both sets contain flaws that came from the data-collection process. For example, some Congressmembers have changed their Twitter names from what the Sunlight Foundation list last recorded. And in some cases, my data-collection script failed to successfully get data from Twitter's API.

I may fix these errors in the future or just leave them in there as an exercise for the user. But keep in mind that this is not meant to be an up-to-date newsworthy dataset.



## Test your system

Just in case you skipped the two previous installation and setup chapters, make sure you can run the following script:

{% include_code test-script.rb %}

Did it work? Good.

Now go into your system's **terminal** and start up **irb**. Copy and paste the contents of the above script and see if it executes without problems.

If no errors come up, great, move on to the next chapter. If not, please contact me at [dan@danwin.com](mailto:&#x64;&#x61;&#x6E;&#x40;&#x64;&#x61;&#x6E;&#x77;&#x69;&#x6E;&#x2E;&#x63;&#x6F;&#x6D;) or on Twitter via [@dancow](http://www.twitter.com/dancow)


