---
layout: post
title: "Organizing the code"
date: 2012-09-12 03:10
comments: true
categories: 
problem: "There's a lot of boilerplate code that we're writing over and over."
solution: "Move the code into a separate text file and begin using our text-editor."
---

So given all the method definitions we've written, how do we actually *use* them? Do we have to keep them in a file and keep copying and pasting into **irb**?

We *could* do that. But what a pain that would be.

Instead, we'll move this boilerplate code to a separate file and re-use it as we've been re-using the `HTTParty` code: with the `require` statement.

## Setup the working directory

First, if you haven't already, make a directory in which you'll be doing all your coding for today. You can do this in the GUI:

TK

Or from the **command-line**:

TK

This working directory should be where you save your files and subdirectories to:

TK

And this is where you will be running **irb** from.


## The my-first-methods.rb file

Let's save all the methods we wrote to a file named `my-first-methods.rb`. And while we're at it, let's throw in the `require` statements that we've been typing so far:

{% include_code organizing-the-code/my-first-methods-1.rb %}


Now launch **irb** in the *same directory* that you saved `my-first-methods.rb` into. And this is how you access the methods you've written so far:

```
load './my-first-methods-1.rb'
download_and_save('http://en.wikipedia.org')
```

The `load` method works similar to `require`, except that it will *reload* the Ruby code whereas `require` will only load the code once unless you restart irb.

The above code snippet should result in a file named `http%3A%2F%2Fen.wikipedia.org` inside your working directory.


## Constants

If we run `download_and_save` many more times, our working directory is going to be cluttered. So let's make a new subdirectory called `my-storage`.

For the rest of our programming, we may want to use this directory for all of our downloaded files. And then maybe later, we might change that directory's location. This sounds like a good use case for variables.

Back in the variables chapter, I mentioned that Ruby variables in all-caps have special meaning. They refer to **constants**, variables with unchanging values.

Let's create a new Ruby file, in your working-directory, called `my-first-constants.rb`. In that file, just include a single line:

`LOCAL_STORAGE_DIR = "my-storage"`

Now, if you `load` the `my-first-constants.rb` file in your `my-first-methods.rb` file, you can have access to the constants defined there.

##### Exercise

In order to prevent downloaded files from cluttering our working directory, we have to alter our existing methods to use the `LOCAL_STORAGE_DIR` constant.

Since the `url_to_local_filename` and `local_file_name_to_url` methods deal with the file naming, it makes sense to do the work there.

So, alter the `url_to_local_filename` to return a filename that also includes what's in the `LOCAL_STORAGE_DIR` constant. The `local_file_name_to_url` also needs to use that constant to reverse translate the filename.

Here are two methods you should consider using:

`File.join`, which takes in as many arguments as you want directories and subdirectories in a given path, including the file name, and returns a string. It handles the problem of joining different parts of paths together without repeating the forward-slash character:

```
1.9.3-head :010 > File.join("directory_alpha", "sub_directory", "filename.txt")
 => "directory_alpha/sub_directory/filename.txt"
1.9.3-head :011 > File.join("directory_alpha/", "/sub_directory", "/filename.txt")
 => "directory_alpha/sub_directory/filename.txt" 
```

`File.basename`, which takes in a filename as a single argument and removes the directory part of the filename:

```
1.9.3-head :012 > fname = "directory_alpha/sub_directory/filename.txt" 
 => "directory_alpha/sub_directory/filename.txt" 
1.9.3-head :013 > File.basename(fname)
 => "filename.txt"
```



##### Answer

{% include_code organizing-the-code/my-first-methods.rb %}





