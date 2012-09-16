---
layout: post
title: "Adding strings together"
date: 2012-09-12 02:03
comments: true
categories: 
problem: "The URLs all share common patterns. How do we combine these together? "
solution: "Strings can be added to other strings. But not all types of data can be combined together."

---


Now that we know how to enter URLs as **strings**, let's review the URL format for retrieving a user's account information:

`http://TK_DATA_ROOT_PATH/users/TKPelosi/show.json`

That gets us the information the Twitter account, `TKPelosi`

To get the information for `TKBohner`:

`http://TK_DATA_ROOT_PATH/users/TKBohner/show.json`

And for `TKrandpaul`:

`http://TK_DATA_ROOT_PATH/users/TKrandpaul/show.json`

In other words, the URL pattern for the account information for any given user is:

`http://TK_DATA_ROOT_PATH/users/TWEET_USER_NAME/show.json`

&ndash; where `TWEET_USER_NAME` is the name of the account.

## Add strings to remove repetition

We're not at this point yet, but conceivably, the program we write would exploit that pattern.

That is, it will use the same *root* string for that URL and append (i.e. *add*) the `TWEET_USER_NAME` part.

But how do we add two strings together? Let's try the first thing that comes to mind:

```
1.9.3p258 :019 > "http://TK_DATA_ROOT_PATH/users/"  + "TKPelosi/" + "show.json"
 => "http://TK_DATA_ROOT_PATH/users/TKPelosi/show.json" 
1.9.3p258 :020 > "http://TK_DATA_ROOT_PATH/users/" + "TKBohner/" + "show.json"
 => "http://TK_DATA_ROOT_PATH/users/TKBohner/show.json"
```

That was easy. Let's examine the pattern for getting pages of tweets for user `TKissa`:

`http://TK_DATA_ROOT_PATH/statuses/TKissa/1/user_timeline.json`
`http://TK_DATA_ROOT_PATH/statuses/TKissa/2/user_timeline.json`
`http://TK_DATA_ROOT_PATH/statuses/TKissa/3/user_timeline.json`

Before we [first learned of strings](TK), we saw that the Ruby interpreter interprets numbers as they are:

```
1.9.3p258 :021 > 1
 => 1 
1.9.3p258 :022 > 2
 => 2 
1.9.3p258 :023 > 42
 => 42
```

And addition seems to work as expected:

```
1.9.3p258 :024 > 21 + 21
 => 42
```

What happens when we try to add a string to a non-quoted number?

``` lang:ruby
1.9.3p258 :025 > "http://TK_DATA_ROOT_PATH/statuses/TKissa/" + 5 + "/user_timeline.json"
TypeError: can't convert Fixnum into String
	from (irb):25:in `+'
	from (irb):25
```

## Mixing datatypes

As you might have guessed, there are more data types in Ruby than just strings. One of them appears to be something called a `Fixnum`, likely a datatype for **numbers**.

And strings and numbers apparently can't be added together.

However, we learned *that anything enclosed by quotes is a* **string**. So what happens when we enclose a number with quotes?

```
1.9.3p258 :026 > "http://TK_DATA_ROOT_PATH/statuses/TKissa/" + "5" + "/user_timeline.json"
 => "http://TK_DATA_ROOT_PATH/statuses/TKissa/5/user_timeline.json"
```

This works because `"5"`, unlike `5`, is a **string**. And two strings can be added together.


### More about numbers and datatypes

It's a common misconception that you need to be great at math in order to program. In fact, you can create some pretty useful programs with little more math than `1 + 1` (though being great at math is helpful if you want to be *great* at programming).

So we won't delve into numbers too much, because this tutorial won't involve much math beyond what you learned in grade school. In the next chapter, we'll re-examine how they are different datatypes than strings. 

##### Exercises

Guess the result of the following addition operations:

``` lang:ruby
"http://" + "en.wikipedia.org" + "/wiki" + "/Ruby"
12 + 300
"11" + "11"
"http://" + "www." + "w" + "3" + ".org"
"2" + 2
```






