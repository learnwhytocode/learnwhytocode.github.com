---
layout: post
title: "How to write an address"
date: 2012-09-12 01:10
comments: true
categories: 
problem: "How do we even put URLs into our programs?"
solution: "Use the String class to represent text characters."
---


Let's step back and ask a basic question: How do we download content from URLs?

It's something we do so automatically &ndash; we simply enter the URL into our browser and hit Enter &ndash; that we don't think about it (many Web users don't even realize that the browser is downloading something *every* time you visit a web address).

But there's no address bar in the Ruby programming environment. We just have text files and the blinking cursor of **irb** to work with.

So where does the URL go?


#### Revisiting irb


<div class="note">
<h6>Break out with Ctrl-C</h6>
<p>Your first efforts at typing in code may result in what seems like being thrown into limbo where the <strong>irb</strong> prompt seemingly refuses to do anything. In these cases, hit <strong>Ctrl-C</strong> a few times and hit <strong>Enter</strong> again, and that should break you out of the limbo loop.
</p>    

<p>And if <strong>irb</strong> <em>really</em> seems to be going haywire, make sure you're actually in irb and <em>not</em> at your system's command prompt. They both look about the same.</p>
</div>


For the first part of this course, we will be programming in the Interactive Ruby console. If you remember it from the [setup guide](post_url 2012-01-10-terminals-and-text-editors), it's the box with the blinking cursor.

Follow these instructions:

1. Open up your Terminal or Command Line
2. Open up the Interactive Ruby Shell by typing `irb` and pressing **Enter**
3. Type a **few numbers**, hit **Enter**; the **irb** prompt should echo those numbers back.

In **irb**, the Ruby interpreter reads your input every time you hit **Enter**.

So start off by typing some numbers:

```
imac-09:~ dnguyen$ irb     <--# this is the system's command line 
1.9.3p194 :001 > 12        <--# this is the irb prompt
 => 12 
1.9.3p194 :002 > 42
 => 42 
1.9.3p194 :003 > 8
 => 8 
1.9.3p194 :004 > 
```


As you can see, the Ruby interpreter accepts input at every press of **Enter**. All we're doing is giving it numbers so all it does in response is repeat those numbers.


### The problem with URLs and other non-numbers

So let's try the same thing with a URL:

```
1.9.3p194 :008 > http://www.bastardsbook.com/
SyntaxError: (irb):8: syntax error, unexpected $end
	from /Users/dnguyen/.rvm/rubies/ruby-1.9.3-p194/bin/irb:16:in `<main>'
```

That didn't go well. None of the above should make sense to you, though the appearance of **irb** indicates that **irb** has a problem. And `syntax error` is pretty clear. And if you really have a good idea for detail, the `8` refers to the `008`, which is the line number of the user input that caused the error.

But the only thing that matters is that the Ruby interpreter doesn't like URLs.

OK, but it seemed to like the phrase `Hello world` from our very first program. Type in that exact phrase into **irb**:

```
1.9.3p194 :009 > hello world
NameError: undefined local variable or method `world' for main:Object
from (irb):9
```

*Doh*.


## Command words and "normal" words 

If you go back to the installation chapter where we ran the `Hello world` program, you'll see that we didn't just type `Hello world`:

``` ruby
puts "Hello world"
```

If you copy-and-paste that into **irb**, everything should go smoothly:

```
1.9.3p194 :014 > puts "Hello world"
Hello world
 => nil 
```

So the difference, besides that word `puts` which we'll get to later, is the **quotation marks:**

```
1.9.3p194 :015 > "hello world"
 => "hello world" 
1.9.3p194 :016 > "hey there"
 => "hey there" 
1.9.3p194 :017 > "you"
 => "you" 
1.9.3p194 :018 > "http://bastardsbook.com/"
 => "http://bastardsbook.com/" 
```

The word `puts`, *without* quotation marks, seems to be some kind of command:
```
1.9.3p194 :019 > puts "hi"
hi
 => nil 
1.9.3p194 :020 > puts

 => nil 
1.9.3p194 :021 > 
```

(I'll cut to the chase: it stands for 'print to screen'. If you enter it in all by itself, nothing is printed to screen.)


So think of it this way: There are obviously words in the Ruby language, such as `puts`, that *do* something. And it doesn't seem likely that *every* word you type into **irb** could refer to an actual Ruby command.


So *how* can the Ruby interpreter tell the difference between command words, such as `puts`, and words that you want it to take in literally, like `http://www.google.com/`? Or, even if you want to use `puts` just as a literal word, not a Ruby command?



### Quotation marks
(todo)



## The String Class




##### Exercise: Fix the broken quotes


