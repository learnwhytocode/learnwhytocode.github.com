---
layout: post
title: "Filter a collection"
date: 2012-09-12 04:02
comments: true
categories: 
problem: "How do I filter for just the Congressmembers of a given state? Or above a certain age?"
solution: "Use a collection's select method."
---

The `select` method accepts a block and filters a collection on whether each of its members passes the `true`/`false` condition:

``` ruby
[1,2,3,4,5,6,7].select do |num|
	num > 4
end
#=> [5, 6, 7]
```

## Ignoring bad data

Use the `select` method to only work with the Congressmember data in which a `twitter_id` is included


## Exercise

Compare the average tweet rate between over 50-year-olds and under 50-year-olds.