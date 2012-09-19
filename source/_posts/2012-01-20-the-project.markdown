---
layout: post
title: "The Project"
date: 2012-09-12 00:30
comments: true
categories: 
problem: "How to gather and analyze U.S. Congressmembers tweets"
solution: "Use programming to avoid tedious, mind-numbing data-entry"
---


This tutorial involves the mashing together of Twitter data with Congressional data [gathered by the Sunlight Foundation](http://services.sunlightlabs.com/). We'll use programming to collect, analyze, and publish it.

Instead of using the Twitter API, I've prepared a small set of sample data to practice on. The data format will be the same (JSON), but the actual pattern of URLs will be different (though vaguely similar) to what you would use when fetching tweets from Twitter's service.

Once you've learned the use of programming, you'll see that details such as the format of the URLs, the actual source of the data, or the size of the dataset are irrelevant, because being able to write code lets you easily adapt your programs to any situation.


### Adaptability

Think of it like being able to take a traditional news story and adapting it for the early edition, for the website, for the wire service, and for a Tumblr post. If you know the story well, and know how to write well, this is an annoying, but relatively quick process.

In programming, though, adapting programs to new situations and demands is far, far easier. And far more powerful. We'll see that the main challenge with mass-processing tweets is parsing Twitter's JSON format. But once you've got the gist of it down, it won't matter if Twitter suddenly changes their data format to XML, Excel spreadsheets, PDF, or printed pieces of paper.


## Tweet stories

It's election season and just about everyone in the information business has at least a psasing interest in what politicians are saying. And in 2012, members of Congress (or their staff) are getting comfortable (a [little too comfortable, sometimes](http://slatest.slate.com/posts/2011/06/06/anthony_weiner_photos_andrew_breitbart_publishes_photo_he_says_i_0.html)) with using Twitter as a podium.

Maybe you're a political reporter and you want to be the first to report a gaffe. If you're a social media expert, maybe you want to analyze social media usage by government. If you're a policy wonk, then you realize that Twitter provides a nicely structured stream of links to a politician's public statements, appearances, and interests.

Don't care about tweets? Then use the same patterns and techniques but with Federal Election Commission spending data or whatever you think is worth investigating. Don't want to publish a whiz-bang web visualization? Then publish your findings in a book.

All of these goals and aspirations have a common hurdle: the time sunk into the mind-numbing work of collecting and organizing data. 

The goal of this tutorial is to show how programming can vastly reduce the least interesting parts of data work so that you can focus on what you actually want to do.


## Test your system

Just in case you skipped the two previous installation and setup chapters, make sure you can run the following script:

{% include_code test-script.rb %}

Did it work? Good.

Now go into your system's **terminal** and start up **irb**. Copy and paste the contents of the above script and see if it executes without problems.

If no errors come up, great, move on to the next chapter. If not, please contact me at [dan@danwin.com](mailto:&#x64;&#x61;&#x6E;&#x40;&#x64;&#x61;&#x6E;&#x77;&#x69;&#x6E;&#x2E;&#x63;&#x6F;&#x6D;) or on Twitter via [@dancow](http://www.twitter.com/dancow)


