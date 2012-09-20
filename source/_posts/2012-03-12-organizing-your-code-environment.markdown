---
layout: post
title: "Organizing your code environment"
date: 2012-09-12 03:12
comments: true
categories: 
problem: "We're writing too much boilerplate code over and over."
solution: "Move the code into a separate text file and begin using our text-editor."
---

If you've taken a break from this tutorial and exited **irb**, you would've had to go through the annoying step of re-running the `require` statements to bring in the `HTTParty` and `JSON` library.

Sure it's just a copy-and-paste action. But like everything about programming, this tedious step can be abstracted out for our convenience.

## Using the text editor

Remember when we installed a text-editor specific for programming (e.g. TextWrangler for OSX, Notepad++ or SciTE for Windows)? Let's move out of **irb** for the moment and use the text-editor.

Hopefully you followed the instructions [in the early setup chapters](/lessons/terminals-and-text-editors) about setting up a **working-directory**. If not, now's the time to do so. Just create a new directory somewhere convenient to get to (such as a sub-directory in your **Downloads** folder).

Then, **in your text-editor**, create a new text file and save it in your **working-directory** as **my_code.rb**

### A place for all your requirements

Inside the **my_code.rb** file, let's put in the boilerplate `require` statements:

``` ruby
require 'rubygems'
require 'json'
require 'httparty'

puts "Done loading my code!"
```


### Require your own file

Now quit out of your current **irb** window by typing `exit`. 

This kicks you back to the command prompt.

At the **command prompt**, try to navigate to wherever your **working directory** was.

If you placed it in `Downloads/my-working-dir`, you should be able to do something like `cd ~/Downloads/my-working-dir` (in OS X) or `cd C:\Downloads\my-working-dir` (for Windows PC).

When you're there, run **irb** and execute the following:

``` ruby
load "./my_code.rb"
```

And this should print out:

`#=> Done loading my code! `


We've simply wrapped up the common libraries we use in a single file.

The keyword `load` is similar to `require`. Except that if we modify **my_code.rb**, `load` will actually re-run the code, whereas `require` will only do so once during an **irb** session.

## Setting constants

Remember back in the variables chapter, how I mentioned that variables that have all-uppercase names have a special meaning?

These upppercase variables, called **constants**, are where we put values that we expect to access *throughout* our programming project (this is an exception to the **scope** concept we learned while writing simple methods).

What are the values that we might use in multiple parts of our program? How about where we actually get the Twitter data from?

Add this after the `require` statements in your **my_code.rb_**:

``` ruby
TWITTER_DATA_HOST = "http://nottwitter.danwin.com"
TWITTER_USER_DATA_PATH = File.join(TWITTER_DATA_HOST, "users")
TWITTER_TWEETS_DATA_PATH = File.join(TWITTER_DATA_HOST, "statuses")
```

Now these constants will be available for use in making the data-retrieval calls. This is not actually best practices for a large programming project. But it serves our purposes for now.


Your entire **my_code.rb** file should look like this:

{% include_code organizing-the-code/my_code.rb %}




