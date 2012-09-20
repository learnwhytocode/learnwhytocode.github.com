---
layout: post
title: "Methods with arguments"
date: 2012-09-12 02:06
comments: true
categories: 
problem: "Adding strings together with plus signs is annoying and hard to read."
solution: "Use the File.join method, which assembles a filename string from multiple strings"
status: checked
---

The methods we've learned so far are simple:

```
"hello world".length
#=> 11

"hello world".class
#=> String
```

## Arguments 

If you've ever used a word-processor, you've probably used the "Find-and-Replace" function. Ruby strings have the `sub` and `gsub` methods ('substitute' and 'global substitute'):

``` ruby
"She sells seashells".sub("se", "fe")
# => "She fells seashells"
```

``` ruby
"She sells seashells".gsub("se", "fe")
# => "She fells feashells"

```

The `sub` and `gsub` methods can be said to require **2 arguments**. Think of **arguments** as the input to the method. In this example, the **first** argument is the string *to be replaced*. The **second** argument is *what to replace it with*.


### About parentheses

In the `sub` and `gsub` methods above, we used **parentheses** to enclose the **arguments**. Unlike many other languages, Ruby makes these optional:


``` ruby
"A1 A2 A3".sub 'A', 'B'
# => "B1 A2 A3"
```

``` ruby
"A1 A2 A3".gsub 'A', 'B'
# => "B1 B2 B3"
```
As you start out, I recommend keeping the parentheses. They may be a pain to type, but they can add readability to your code.


## Exercise

In the last chapter, we added a bunch of strings together to form a URL:

``` ruby 
"http://nottwitter.danwin.com/statuses/" +  "DarrellIssa" + "/" + 2.to_s + "/" +  "user_timeline.json"

#=> "http://nottwitter.danwin.com/statuses/DarrellIssa/user_timeline.json"

```

Not only is this a pain to read and write, it's prone to mistakes:

``` ruby
"http://nottwitter.danwin.com/statuses" +  "DarrellIssa" + 2.to_s + "/" +  "user_timeline.json"

#=> "http://nottwitter.danwin.com/statusesDarrellIssa2/user_timeline.json"

"http://nottwitter.danwin.com/statuses/" +  "/DarrellIssa/" + "/" + 2.to_s + "/" +  "user_timeline.json"

#=> "http://nottwitter.danwin.com/statuses//DarrellIssa//2/user_timeline.json"

```

Look at the [documentation for the](http://www.ruby-doc.org/core-1.9.3/File.html#method-c-join) `File.join` method and see if you can come up with a better way to compose the URL.

### Answer

``` ruby

File.join("http://nottwitter.danwin.com/statuses", "DarrellIssa", 2.to_s, "user_timeline.json")
#=> "http://nottwitter.danwin.com/statuses/DarrellIssa/2/user_timeline.json"

File.join("http://nottwitter.danwin.com/statuses/", "/DarrellIssa", 2.to_s, "user_timeline.json")

#=> "http://nottwitter.danwin.com/statuses/DarrellIssa/2/user_timeline.json"
```

----
The point of this chapter is *not* to memorize these method names, but to be familiar with the pattern of **methods** taking in **arguments** (i.e. *inputs*) and returning a value.

We'll be using `File.join`, `sub`, and `gsub` later on, but if you forget their names or what they do, you can look them up easily enough. 