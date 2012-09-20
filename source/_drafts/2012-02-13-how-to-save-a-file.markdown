---
layout: post
title: "How to save a file"
date: 2012-09-20 02:13
comments: true
categories: 
problem: "How do we save downloaded files to our hard drive?"
solution: "Use the methods belonging to Ruby's File class."
---

TK(move this to a later lesson)

We know how to *get* files. But we don't yet know how to *save* them, in the way that we can from a web browser.

Let's look up Ruby's methods to open and save files in the [`File` class documentation](http://www.ruby-doc.org/core-1.9.3/File.html "Class: File (Ruby 1.9.3)")


## The File class

The [documentation for `File.open`](http://www.ruby-doc.org/core-1.9.3/File.html#method-c-open) has what we want, though it tells us to check out the documentation for [`IO.new`](http://www.ruby-doc.org/core-1.9.3/IO.html#method-c-new) for more details.

__Note__: "IO" stands for "input/output" and is "the basis for all input and output in Ruby." The `File` class is the *child* of the `File` class, a concept in object-oriented programming that we won't be digging into right now. The upshot is that the `File` class *inherits* methods from the `IO` class, hence the extra click-through.

The documentation actually takes its time to answer our simple question, so I'll just get right to the syntax on how to save a file to disk:

```
my_file = File.open("somefilename.txt", 'w')
```

`File.open` takes two parameters: 
1. **filename** 
2. a **string** that represents the *mode*. `"w"`, as you might guess, stands for **write**-mode. The `IO.new` [documentation](http://www.ruby-doc.org/core-1.9.3/IO.html#method-c-new) lists the other modes, though the other one we're primarily interested in is `r` for **read**-mode


The variable `my_file` is assigned to what is called a **stream**, into which you can write data. The above statement should result in a file called `somefilename.txt` in the directory that you are running **irb** in.


Just in case you're confused where **irb** is doing its work, here's some walkthrough code:

```
1.9.3-head :001 > Dir.getwd
 => "/Users/dairy/Desktop" 
1.9.3-head :002 > my_file = File.open("this_is_a_test_file.txt", "w")
 => #<File:this_is_a_test_file.txt>
```


The `Dir.getwd` method (`wd` stands for "working directory") returns the directory that **irb** is working from. So passing a filename into the `File.open` will create a file with that name in the working directory. Use your operating system's GUI to verify that `this_is_a_test_file.txt` exists. If you open that file, it should be empty.

### Writing data to disk

Continuing from the code snippet above, here's how to fill that empty text file and save it:

```
1.9.3-head :003 > my_file.write("Hello text file!")
 => 16
1.9.3-head :004 > my_file.close
 => nil
```

Just as we `open` a file, it makes sense that we need to `close` it. The `close` method saves the stream to disk, so open up `this_is_a_test_file.txt` and verify that it contains `Hello text file!`.

After you `close` a file, you cannot write to it again without re-opening it:

```
1.9.3-head :005 > my_file.write("trying to write some more")
IOError: closed stream
	from (irb):5:in `write'
	from (irb):5
```

### Rewrite and overwrite

Try opening the same filename as used above in **write** mode again. Write some text and **close** the file.

What happens?

Whatever was in the file previously was wiped out with the new input. Obviously, you want to be **careful** about how you use the write-mode when opening files. For the purposes of this lesson, we won't be writing to any files that we can't easily replace, but if you haven't been already, you're going to have to *think* before you run code because it's not all benign.


##### Exercise

Write the code that: 

1. Downloads the data from TK
2. Saves the result to a file named "TKtweets.json"


``` ruby
require 'rubygems'
require 'httparty'

resp = HTTParty.get("TK")

fh = File.open("TKtweets.json", "w")
fh.write(resp)
fh.close

```

There should be a file named `TKtweets.json` wherever you executed the code above.
