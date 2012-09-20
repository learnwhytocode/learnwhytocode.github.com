---
layout: post
title: "Labeling the data"
date: 2012-09-12 02:07
comments: true
categories: 
problem: "A lot of the text we're using is repeated over and over."
solution: "Use variables to store data for later reference in our programs."
status: checked
---


We've seen how the URLs for pulling in Twitter information have a pattern. For example, the user info URLs for 4 different users looks like this:

`http://nottwitter.danwin.com/users/JoeLieberman/show.json`
`http://nottwitter.danwin.com/users/NancyPelosi/show.json`
`http://nottwitter.danwin.com/users/SenRandPaul/show.json`
`http://nottwitter.danwin.com/users/jaredpolis/show.json`

Everything about the URLs is the same. Except the screen name. Using **variables**, we can store the repetitive parts of the strings for repeated references:

``` ruby
base_twit_url = "http://nottwitter.danwin.com/users/"
end_twit_url = "/show.json"

base_twit_url + "JoeLieberman" + end_twit_url
# => "http://nottwitter.danwin.com/users/JoeLieberman/show.json" 

File.join(base_twit_url, 'NancyPelosi', end_twit_url)
# => "http://nottwitter.danwin.com/users/NancyPelosi/show.json"
```


## Labels for data

After learning about strings, your first thought may be: *Hey, why aren't those non-quoted strings causing errors? Does the Ruby language reserve a word called `base_twit_url`?* 

In the above example, the `base_twit_url` is neither a string (because it's not set off by quotes) nor a reference to a Ruby command. Instead, it is a Ruby **variable**; it is also called a **pointer**, because it *points* to something.

What does `base_twit_url` *point* to? The string, `"http://nottwitter.danwin.com/users/"`

How does the the Ruby interpreter know that `base_twit_url` refers to that string? Because we used the **assignment operator** &ndash; the equals sign,  `=`

```
base_twit_url = "http://nottwitter.danwin.com/users/"
```

After that **assignment**, Ruby knows that we are using `base_twit_url` as a stand-in for the longer string.

Think of variables as a way of *labeling* objects, as if to say, *I'm giving this here data object the nickname of `my_string`*



### Variable naming

How did Ruby know that `base_twit_url` was going to be a proper variable, rather than erroneous input (as is the case if you type in a URL at the irb prompt)? 

The Ruby interpreter recognizes sequences of **alphanumeric characters and underscores**, as variables.

So, these are *not* variable names:

* `hey-you` (hyphens are not alphanumeric, though the underscore character is allowed)
* `hey!` (exclamation marks are not alphanumeric)
* `hello world` (spaces aren't allowed)
* `100var` (you can't begin a variable with a number)

Here are properly-named variables:

* `hey_you`
* `HEY` 
* `helloWorld`
* `var100`
* `x`
* `super_cali_fragilistic_expealidocious`

#### About constants
In Ruby, and in other languages, variables that begin with uppercase letters (or are *all* uppercase) have a special meaning. To keep things simple for now, **just stick to using alphabetical and underscore characters** .

(I would also advise not to use numbers, because they can lead to vaguely named variables).



### Variable assignment

It's still not clear how Ruby distinguishes between a word like `puts` and some variable we just made up, such as `puts_this_in_your_pipe`. Try entering both into **irb**:

```
puts

# => nil 

puts_this_in_your_pipe
NameError: undefined local variable or method `puts_this_in_your_pipe' for main:Object
```

What happened here? The Ruby interpreter didn't choke on `puts` because *somewhere*, somehow, `puts` was defined.

However, the word `puts_this_in_your_pipe` apparently was *not* defined; hence, the complaint about a `undefined local variable or method`.

The most common way to tell Ruby that "*this here word I've made up is meant to be a variable*" is to *assign* it a value using the *assignment operator*:

```
puts_this_in_your_pipe = 'water'
# => "water" 
puts_this_in_your_pipe
# => "water" 
```

The Ruby interpreter doesn't throw an error here because we've defined the `puts_this_in_your_pipe` variable.


## Exercise

Recall the format for the URLs in this tutorial:

* User info: [http://nottwitter.danwin.com/users/SenRandPaul/show.json](http://nottwitter.danwin.com/users/SenRandPaul/show.json)
* First page of tweets: [http://nottwitter.danwin.com/statuses/senatorboxer/1/user_timeline.json](http://nottwitter.danwin.com/statuses/senatorboxer/1/user_timeline.json)

Express these strings by abstracting out the unchanging segments and assigning them to variables.

### Answer

The first thing to note is that the data server, `http://nottwitter.danwin.com`, is going to be the same for each data URL. So our first variable can be:

``` ruby
data_host_name = "http://nottwitter.danwin.com"
```

From there, the two types of data calls diverge. But when doing multiple requests for **user info**, only the **screen name** part changes. So let's put the rest into two other variables.

``` ruby
user_info_path = 'users'
user_info_basefile = 'show.json'

```

For requests of tweet pages:

``` ruby
tweets_page_path = 'statuses'
tweets_page_basefile = 'user_timeline.json'

```

Now to rewrite the calls:

``` ruby
# for user info:
File.join(data_host_name, user_info_path, 'SenRandPaul', user_info_basefile)

# for tweet pages
File.join(data_host_name, tweets_page_path, 'senatorboxer', '1', tweets_page_basefile)
```

Note: in actual practice, we would consider these variables to be **constants**. The convention is to uppercase constants' names:


``` ruby
File.join(DATA_HOST_NAME, USER_INFO_PATH, 'SenRandPaul', USER_INFO_BASEFILE)

File.join(DATA_HOST_NAME, TWEETS_PAGE_PATH, 'senatorboxer', '1', TWEETS_PAGE_BASEFILE)
```


Admittedly, that may not seem like we saved ourselves a lot of work.  Because the variable names seem so much longer than what they represent, it seems there's a lot of code-to-actual-data, which doesn't seem ideal.

But as we write more complex programs, we'll find that descriptive names are extremely useful in figuring out what's going on

Here's one of the best words of advice I've ever picked up about programming:

{% blockquote Steve McConnell, Code Complete: A Practical Handbook of Software Construction http://www.amazon.com/Code-Complete-Practical-Handbook-Construction/dp/0735619670 %}
Code is read far more times than it's written
{% endblockquote %}


