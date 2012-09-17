---
layout: post
title: "Labeling the data"
date: 2012-09-12 03:01
comments: true
categories: 
problem: "A lot of the text we're using is repeated over and over."
solution: "Use variables to store data for later reference in our programs."
---


We've seen how the URLs for pulling in Twitter information have a pattern. For example, the user info URLs for 4 different users looks like this:

`http://TK_DATA_ROOT_PATH/users/TKBohner/show.json`
`http://TK_DATA_ROOT_PATH/users/TKPelosi/show.json`
`http://TK_DATA_ROOT_PATH/users/TKrandpaul/show.json`
`http://TK_DATA_ROOT_PATH/users/TKRepPaulRyan/show.json`

Everything about the URLs, except the account name, is the same. Using **variables**, we can store the repetitive parts of the strings for repeated references:

``` 
1.9.3p258 :015 > base_twit_url = "http://TK_DATA_ROOT_PATH/users/"
 => "http://TK_DATA_ROOT_PATH/users/" 
1.9.3p258 :016 > end_twit_url = "/show.json"
 => "/show.json" 

1.9.3p258 :017 > base_twit_url + "TKBohner" + end_twit_url
 => "http://TK_DATA_ROOT_PATH/users/TKBohner/show.json" 
1.9.3p258 :018 > base_twit_url + "TKPelosi" + end_twit_url
 => "http://TK_DATA_ROOT_PATH/users/TKPelosi/show.json"
```


## Labels for data

After learning about strings, your first thought may be: *Hey, why aren't those non-quoted strings causing errors? Does the Ruby language reserve a word called `base_twit_url`?* 

In the above example, the `base_twit_url` is neither a string (because it's not set off by quotes) nor a reference to a Ruby command. Instead, it is a Ruby **variable**; it is also called a **pointer**, because it *points* to something.

What does `base_twit_url` *point* to? The string, `"http://TK_DATA_ROOT_PATH/users/"`

How does the the Ruby interpreter know that `base_twit_url` refers to that string? Because we used the **assignment operator** &ndash; the equals sign,  `=`

```
1.9.3p258 :015 > base_twit_url = "http://TK_DATA_ROOT_PATH/users/"
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

Here are proper variables:

* `hey_you`
* `HEY` 
* `helloWorld`
* `var100`
* `x`
* `super_cali_fragilistic_expealidocious`

In Ruby, and in other language, variables that begin with uppercase letters (or are *all* uppercase) have a special meaning. To keep things simple for now, just stick to using alphabetical and underscore characters (I would try to avoid using numbers, because they can be confusing).



### Variable assignment

It's still not clear how Ruby distinguishes between a word like `puts` and some variable we just made up, such as `puts_this_in_your_pipe`. Try entering both into **irb**:

```
1.9.3p258 :001 > puts

 => nil 
1.9.3p258 :002 > puts_this_in_your_pipe
NameError: undefined local variable or method `puts_this_in_your_pipe' for main:Object
```

What happened here? The Ruby interpreter didn't choke on `puts` because *somewhere*, somehow, `puts` was defined.

However, the word `puts_this_in_your_pipe` apparently was *not* defined; hence, the complaint about a `undefined local variable or method`.

The most common way to tell Ruby that "*this here word I've made up is meant to be a variable*" is to *assign* it a value using the *assignment operator*:

```
1.9.3p258 :003 > puts_this_in_your_pipe = 'water'
 => "water" 
1.9.3p258 :004 > puts_this_in_your_pipe
 => "water" 
```

The Ruby interpreter doesn't throw an error here because we've defined the `puts_this_in_your_pipe` variable.


##### Exercises
(todo) What do we name our variables?






