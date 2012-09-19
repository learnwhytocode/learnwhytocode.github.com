---
layout: post
title: "Pick out the text of a tweet"
date: 2012-09-12 03:03
comments: true
categories: 
problem: "How does Ruby represent the data found for a Twitter account?"
solution: "The Hash is a data object that lets us access the attributes contained in the Twitter data."
---
 
In the last chapter we parsed a JSON file containing Twitter account information.

But what does that mean, exactly?

Run the routine again to fetch the info for a Twitter account:

``` ruby
require 'rubygems'
require 'json'
require 'httparty'

url = "TK"
json_str = HTTParty.get(url).body
twitter_user = JSON.parse(json_str)
```

**Note:** The rest of this lesson assumes that `twitter_user` contains the value that it does at the end of this routine. If you exit and relaunch **irb**, just re-run this routine to follow along again.


What is the `class` of the parsed JSON?

``` ruby
puts twitter_user.class
#=> Hash
```

## The Hash Object

The `Hash` is one of Ruby's **collection** classes and is ubiquitous in Ruby coding (in Python, it's called a **dictionary**).

**Collection** classes are data objects that are collections of other data objects (so yes, this means a `Hash` can contain many other `Hash` objects). 

Here's how a simple `Hash` object is initialized:

```
simple_hash = {'a'=>101} 
```

* The curly-braces denote the entire `Hash`. 
* Hashes are composed of **key-value** pairs
* This `simple_hash` has only one item, i.e. one **key-value** pair
* The **key** in that single pair is on the *left* side: `'a'`. The **value** is on the *right*, i.e. 101




### Accessing members of a Hash

To access an item in a `Hash`, we use **square-bracket notation** to specify the **key** of the **value** that we want. 

```
simple_hash = {'a' => 101}
puts simple_hash['a']
# => 101
```

Try it yourself. In the `Hash` below:
1. Print out the value at key `42`
2. Access the pair with the value of `"dog"` and store the value (i.e. `"dog"`) in a variable

```
multi_hash = {'a' => 101, 42 => 'life', 999 => '9', "Hello world" => "dog"}

puts multi_hash[42]
#=> life
v = multi_hash['Hello world']
puts v
#=> "dog"
```



## Exercise

Go back to the `twitter_user` object, which we initialized at the beginning of this lesson. Print out:

1. The user's real name
2. The user's Twitter bio
3. The user's number of followers


**Hint:** Printing out the `twitter_user` object might be helpful here.


### Answer

``` ruby

puts twitter_user['name']
#=> Nancy Pelosi

puts twitter_user['description']
#=> Democratic Leader, focused on strengthening America's middle class and creating jobs; mother, grandmother, dark chocolate connoisseur.

puts twitter_user['followers_count']
#=> 226259

```

**Bonus:** What happens when you try to access a non-existent key?