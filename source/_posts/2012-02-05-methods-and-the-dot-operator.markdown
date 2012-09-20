---
layout: post
title: "Methods and the dot operator"
date: 2012-09-20 02:05
comments: true
categories: 
problem: "How do we tell numbers and strings apart?"
solution: "Use the dot operator to access methods and attributes of data objects."
status: checked
---

This chapter &ndash; and this entire tutorial, actually &ndash; tip-toes around the topic of [object-oriented programming](http://en.wikipedia.org/wiki/Object-oriented_programming).

In Ruby, everything is considered an "object". We've encountered at least two different objects: strings and numbers, also known as `String` and `Fixnum`, respectively.

We saw how they don't mix so easily:

``` ruby
"two" + 2
TypeError: can't convert Fixnum into String
	from (irb#1):1:in `+'
	from (irb#1):1
"2" + 2
TypeError: can't convert Fixnum into String
	from (irb#1):2:in `+'
	from (irb#1):2
```

Just so we don't run into this `TypeError` problem again, how *do* we tell objects apart?

## The dot operator

Try these commands in **irb**:

``` ruby
1.class
"1".class
"one".class
```

You should see something like this:

``` ruby
1.class
# => Fixnum 
"1".class
# => String
"one".class
# => String

```

When we say that `1` is an **object**, we mean that it has *properties and methods*. In the example above, we accessed the `class` **method** of the `1` and `"1"` objects.

Think of `class` as the **type** of an object.

Take special note of the role of the period above. This is the **dot operator** (i.e. the period). That dot is a Ruby symbol used to invoke a method. In the above example, the **dot operator** is used to invoke the `class` **method** of the **object**, `1`.


## Methods

There are many more methods than just `class`. And methods are how we will accomplish some very useful tasks despite not doing much programming ourselves.

Every `class` of object has its own methods.

For example, the `length` method returns the number of characters in the invoking string:

``` ruby
"supercalifragilistic".length
# => 20
```

But the `length` method does not exist for numbers, because it doesn't make sense to have that functionality:

``` ruby
42.length
NoMethodError: undefined method `length' for 42:Fixnum
	from (irb#1):6
```

Methods **return** a value. The `upcase` method returns a string: 

``` ruby
"chicken".upcase
#=> CHICKEN
```

This means you can **chain** together methods. Let's find out the *type of object* that the **string**'s `length` method **returns** by invoking the `class` method, like so:

``` ruby
"http://www.nytimes.com".length.class
# => Fixnum
```

If the result is a `Fixnum` (i.e. a number), then this is possible:

``` ruby
"supercalifragilistic".length + "http://www.nytimes.com".length
# => 42 
```

### Conversion methods

Here's one method that will be particularly useful to us: the `to_s` method, which converts its invoking object to a *string*:

``` ruby
"10" + 20
TypeError: can't convert Fixnum into String
	from (irb#1):11:in `+'
	from (irb#1):11
	
"10" + 20.to_s
# => "1020"
```

There's also a `to_i` method (the `i` stands for *integer*):

``` ruby
"10".to_i + "20".to_i
# => 30
```

We'll be using many more methods in the chapters to come. The main takeaways are these:

1. Every data type (i.e. **class**) has its own methods
2. Methods **return** a value
3. If you're unsure of what a value's datatype is, use its `class` method to find out.

How do we know what methods exist? It's a mix of looking up documentation and eventually memorizing the ones most helpful to you. Luckily, this is just a web search away for most methods.


##### Exercises:

What is the `class` of `42.2`?

What is the resulting `class` of: `100 + 42.2` ?

Use addition and a conversion method to join these objects:  `"http://nottwitter.danwin.com/statuses/"`, `"DarrellIssa"`, `"/"`, `2`, `"/"`, `"user_timeline.json"` 


Check out Ruby's [documentation of the String class](http://www.ruby-doc.org/core-1.9.3/String.html "Class: String (Ruby 1.9.3)") for more `String` methods. See if you can find the method that replaces characters in a string with other characters.





