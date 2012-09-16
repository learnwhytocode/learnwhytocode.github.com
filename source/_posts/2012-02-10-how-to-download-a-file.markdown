---
layout: post
title: "How to download a file"
date: 2012-09-12 02:10
comments: true
categories: 
problem: "How do we actually download files off the Internet?"
solution: "The HTTParty gem provides methods to easily download from URLs."
---

So we've learned how to input URLs in the Ruby interpreter. But how do we actually *download* something?

In the last chapter, we learned about how variables can *point* to data objects, such as strings. But there are also pointers to blocks of code that actually *do* something, such as **methods**.

In fact, `puts` is a method. And there are many other methods which can do much more than print to screen. Much of the power of programming is being able to hugely complex operations by invoking a single word &ndash; the name of a method.

So to download a file, all we need to do is find the name of the method that contains the downloading functionality.

### It's a HTTParty

Doing a few Google searches for "Ruby" and "download TK" will net us a few options. The most fun-sounding one is John Nunemaker's [HTTParty](https://github.com/jnunemaker/httparty) gem, which claims to make "http fun again!"

<div class="note">
If you haven't installed Rubygems yet or the HTTParty gem, refer back to the <a href="TK">installation chapter</a>.	
</div>

According to the [documentation](https://github.com/jnunemaker/httparty#readme), here's how to download from a URL:

```
require 'rubygems'
require 'httparty'
response = HTTParty.get(TK)
puts response

```


Let's dissect this code snippet.


#### The 'require' statement

The Ruby keyword `require` is a **method** that, when given a **string**, pulls in the library of code that that string refers to.

The first `require` call tells the Ruby interpreter that we'll be using **rubygems**, Ruby's convenient framework of packaging these libraries.

The second `require` call pulls in the code for the [HTTParty](https://github.com/jnunemaker/httparty) gem. By convention, the actual strings used to refer to the gem use lowercase letters, underscores, and sometimes hyphens (In the case of HTTParty, you *can* refer to it as `require "HTTParty"`).


In irb, you should see this:

```
1.9.3p258 :002 > require 'rubygems'
 => false 
1.9.3p258 :003 > require 'httparty'
 => true
```




### The 'get' method

This next line is where the interesting work is done:

```
response = HTTParty.get('TK')
```

First, focus on what's to the *right* of the **equals sign** (which we learned is the **assignment operator**).

```
HTTParty.get('TK')
```

Following the `get` is a **string**, wrapped in **parentheses**. These parentheses denote the **arguments** for the `get` method. I'll explain **arguments** later.

*The parentheses are actually optional, but let's pretend that they need to be there for now.* 


**To review:** 

To download a file from `"TK"`, we call this method:

`HTTParty.get("TK")`

* `HTTParty` is the **object**
* `get` is a **method** of `HTTParty`
* and the string `"TK"` is an **argument** that we pass to the `get` **method**


Why is the object named `HTTParty` and its method `get`? Because the author wanted it that way. What is the code behind `get`? You can examine it later on your own, as the author [has generously made it open source](https://github.com/jnunemaker/httparty), but let's be content for now that it works as the author claims in the documentation.


### Variables, revisited

Let's go back to the original code that contained the variable assignment:

```
response = HTTParty.get('TK')
```

The variable named `response` contains the return value of the `get` method. 

TK What does it contain? 


