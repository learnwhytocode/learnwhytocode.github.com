---
layout: post
title: "How to write an address"
date: 2012-09-12 02:02
comments: true
categories: 
problem: "How do we even put URLs into our programs?"
solution: "Use the String class to represent text characters."
status: checked
section_header: "Basic Data Types"
---


Let's step back and ask a basic question: How do we download content from URLs?

It's something we do so automatically &ndash; we simply enter the URL into our browser and hit Enter &ndash; that we don't think about it (many Web users don't even realize that the browser is downloading something *every* time you visit a web address).

But there's no address bar in the Ruby programming environment. We just have text files and the blinking cursor of **irb** to work with.

So where does the URL go?


### Revisiting irb



For the first part of this course, we will be programming in the Interactive Ruby shell. If you remember it from the [setup guide](/lessons/terminals-and-text-editors), it's the box with the blinking cursor.

Follow these instructions:

1. Open up your Terminal or Command Line
2. Open up the Interactive Ruby Shell by typing `irb` and pressing **Enter**
3. Type a **few numbers**, hit **Enter**; the **irb** prompt should echo those numbers back.

In **irb**, the Ruby interpreter reads your input every time you hit **Enter**.

So start off by typing some numbers:

```
imac-09:~ dnguyen$ irb     # <-- this is the system's command line 
1.9.3p194 :001 > 12        # <-- this is the irb prompt
 => 12 
1.9.3p194 :002 > 42
 => 42 
1.9.3p194 :003 > 8
 => 8 
1.9.3p194 :004 > 

```

(**Note**: The info before the prompt, `1.9.3p194 ... >`, is system information and may be different for you. The only thing to worry about now is what's on the *right* of the `>`)

As you can see, the Ruby interpreter accepts input at every press of **Enter**. All we're doing is giving it numbers so all it does in response is repeat those numbers.


**Break out with Ctrl-C**:

Your first efforts at typing in code may result in being thrown in what seems like limbo: the <strong>irb</strong> prompt seemingly refuses to do anything. In these cases, hit <strong>Ctrl-C</strong> a few times and hit <strong>Enter</strong> again, and that should break you out of the limbo loop.

And if <strong>irb</strong> <em>really</em> seems to be going haywire, make sure you're actually in irb and <em>not</em> at your system's command prompt. They both look about the same.




### The problem with URLs and other non-numbers

So let's try the same thing with a URL:

```
1.9.3p194 :008 > http://journalists.org
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
1.9.3p194 :018 > "http://journalists.org/"
 => "http://journalists.org/" 
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


So how can the Ruby interpreter tell the difference between command words, such as `puts`, and words that we want it to take in literally, like `http://www.google.com/`? Or, even if we want to use `puts` just as a literal word, not a Ruby command?


### Quotation marks
Quotation marks in written English denote dialogue:

{% blockquote Steve Wozniak, Keynote address at 5th HOPE conference %}
"Wherever smart people work, doors are unlocked."
{% endblockquote %}


They also denote something special in programming: 

``` ruby
puts "Hello"
puts "puts"
```

Try pasting the URL at the beginning of the lesson into **irb**

```
"http://journalists.org"
```

No errors! Congrats, we've just discovered the **String**, one of Ruby's basic datatypes (and for most other programming languages).




## The String Class

**Strings** are sequences &ndash; i.e. *strings* &ndash; of characters, which can include a single letter, words, numbers, or the entire text of Shakespeare. 

Here are some examples of strings:

``` ruby
"A"
'A deer.'
"100 + 12"
"2 be, or not 2 be!"
"@#4jasdfklj23kl4j#@$@#$"
```

The quotation marks are the symbols that set off the string. When the Ruby interpreter sees the first quotation mark, it knows that we are creating a string. Everything *after* that quotation mark is considered a string. When the *second* quotation mark is reached, the Ruby interpreter knows the string is done:

```
1.9.3p258 :001 > " this is a beginning of a string
1.9.3p258 :002"> strings can include new lines
1.9.3p258 :003"> 1
1.9.3p258 :004"> 2  3  4 
1.9.3p258 :005"> 5
1.9.3p258 :006"> still going on
1.9.3p258 :007"> And this is
1.9.3p258 :008"> the end"
 => " this is a start of a string
strings can include new lines
1 
2 3 4
5
still going on
And this is
the end" 
```

### Single quote marks

Either double-quote *or* single-quote marks can be used to create strings:

```
'Hey there'
"How's it going?"
'Good'
```

Note that in the second example, a **single-quote** mark was treated as a *literal* character (i.e. with no special meaning by the Ruby interpreter) because the string is enclosed in **double-quote** marks.

The upshot of this &ndash; and a common cause of error and confusion for beginners &ndash; is that the **same type of quote-mark that opens a string must be used to close it**.

In **irb**, we're used to the Ruby interpreter responding with feedback after we press **Enter**. However, if we don't close the string properly when hitting **Enter**, the Ruby interpreter will assume that the pressing of **Enter** means we want a *new line*. Because inside a string, a *new line* is just another character:

```
1.9.3p258 :013 > puts "Hello world!'
1.9.3p258 :014"> 
1.9.3p258 :015"> hey 
1.9.3p258 :016"> why didn't anything get puts?
1.9.3p258 :017"> ???
1.9.3p258 :018"> oops, need to use double quote => "
Hello world!'

hey 
why didn't anything get puts?
???
oops, need to use double quote => 
 => nil 
1.9.3p258 :019 > 
```

For simplicity sake, I recommend using **double-quotes** at all times during the scope of this tutorial.


##### Exercise: Fix the broken quotes

Knowing the above pitfall above, fix the broken strings on each line below so that each line is its own self-contained string:

``` ruby
puts "Hello world'
'The cat's at""
"The man said, 'Why hello good sir, how do you do?'. And I responded, 'Well.'
```

----

What have we learned so far? Just how to get the Ruby interpreter to read URLs as strings. Think of it as that we now know the *method of entry* for data. Nothing has happened yet (other than the string being echoed back).
